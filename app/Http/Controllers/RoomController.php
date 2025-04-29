<?php

namespace App\Http\Controllers;

use App\Models\Buildings;
use App\Models\RoomReservation;
use App\Models\Rooms;
use App\Models\AccessPoints;
use App\Models\Logs;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RoomController extends Controller
{
    public function index(){
        $allRooms = Rooms::all();
        return response()->json($allRooms);
    }

    public function getAllRoomsByBuildingId($building_id)
    {
        // Step 1: Find the rooms by building ID
        $rooms = Rooms::where('buildings_id', $building_id)->get();

        // Step 2: If no rooms are found, return a 404 response
        if ($rooms->isEmpty()) {
            return response()->json(['message' => 'No rooms found for this building'], 404);
        }

        // Step 3: Return the rooms data in the response
        return response()->json([
            'success' => true,
            'data' => $rooms
        ]);
    }

    public function getRoomById($room_id){
        $room= Rooms::find($room_id);
        if (!$room) {
            return response()->json(['message' => 'Room not found'], 404);
        }

        return response()->json($room, 200);
    }

    public function whoEnteredMyRoom(Request $request)
    {
        // Get the time interval parameters
        $fromDate = $request->input('from_date');
        $toDate = $request->input('to_date');

        // Validate the input date format
        if (!$fromDate || !$toDate) {
            return response()->json(['success' => false, 'message' => 'Please provide both "from_date" and "to_date"'], 400);
        }

        // Parse the dates into Carbon instances
        try {
            $fromDate = Carbon::parse($fromDate);
            $toDate = Carbon::parse($toDate);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Invalid date format. Please use "YYYY-MM-DD HH:MM" format.'], 400);
        }

        // Ensure 'from_date' is before 'to_date'
        if ($fromDate->gt($toDate)) {
            return response()->json(['success' => false, 'message' => '"from_date" must be earlier than "to_date"'], 400);
        }

        $room_id = Auth::user()->personal_informations->myRoomID;

        // Step 1: Find the room by its ID
        $my_room = Rooms::find($room_id);
        if (!$my_room) {
            return response()->json(['success' => false, 'message' => 'Room not found'], 404);
        }

        // Step 2: Find the related access point
        $accessPoint = AccessPoints::where('room_id', $room_id)->first();
        if (!$accessPoint) {
            return response()->json(['success' => false, 'message' => 'Access point not found for this room'], 404);
        }

        // Step 3: Find logs within the time interval and get the user data
        $userLogs = Logs::where('access_point_id', $accessPoint->id)
            ->join('personal_informations', 'logs.user_id', '=', 'personal_informations.user_id')
            ->whereBetween('logs.created_at', [$fromDate, $toDate]) // Filter by time interval
            ->select('logs.user_id', 'personal_informations.fullName', 'logs.created_at') // Select needed columns
            ->get(); // Fetch the results

        // Format the data to match the required structure
        $formattedLogs = $userLogs->map(function ($log) {
            return [
                'user_id' => $log->user_id, // Change to 'user_id'
                'full_name' => $log->fullName,
                'entry_time' => Carbon::parse($log->created_at)->toIso8601String(), // Format date as ISO 8601 string
            ];
        });

        // Format the data to match the required structure with the desired format
        $formattedLogs = $userLogs->map(function ($log) {
            return [
                'user_id' => $log->user_id, // Change to 'user_id'
                'full_name' => $log->fullName,
                'entry_time' => Carbon::parse($log->created_at)->format('Y-m-d H:i'), // Format date as 'YYYY-MM-DD HH:MM'
            ];
        });


        return response()->json([
            'success' => true,
            'data' => $formattedLogs
        ]);
    }

    public function create(Request $request)
    {
        // Validate the request data
        $validatedData = $request->validate([
            'buildings_id' => 'required|exists:buildings,id',
            'room_name' => 'required|string|max:255',
            'room_type' => 'required|string|max:255',
            'room_status' => 'required|boolean',
        ]);

        // Create a new room
        $room = Rooms::create($validatedData);

        // Return success response
        return response()->json([
            'message' => 'Room created successfully',
            'room' => $room
        ], 201);
    }

    public function deleteById($room_id){
        // Find the room by ID
        $room = Rooms::find($room_id);

        // Check if the room exists
        if (!$room) {
            return response()->json([
                'message' => 'Room not found'
            ], 404);
        }

        // Delete the room
        $room->delete();

        // Return success response
        return response()->json([
            'message' => 'Room deleted successfully'
        ], 200);
    }

    public function reserveRoom(Request $request)
    {
        // Check if the user is authenticated
        if (!Auth::check()) {
            return response()->json(['message' => 'User not authenticated'], 401);
        }

        // Manually retrieve data from the request
        $roomId = $request->input('room_id');
        $startTime = $request->input('start_time');
        $endTime = $request->input('end_time');
//        $purpose = $request->input('purpose', null); // Optional field
        $roomInventory = $request->input('room_inventory', null); // New field
        $participantNumber = $request->input('participant_number', null); // New field
        $description = $request->input('description', null); // New field
        $eventType = $request->input('event_type', null); // New field

        // Manually check if required fields are provided
        if (!$roomId || !$startTime || !$endTime) {
            return response()->json(['message' => 'Missing required fields.'], 400);
        }

        // Check if the room exists
        $room = Rooms::find($roomId);
        if (!$room) {
            return response()->json(['message' => 'Room not found.'], 404);
        }

        // Ensure start_time is after the current time
        if (strtotime($startTime) <= time()) {
            return response()->json(['message' => 'Start time must be in the future.'], 400);
        }

        // Ensure end_time is after start_time
        if (strtotime($endTime) <= strtotime($startTime)) {
            return response()->json(['message' => 'End time must be after start time.'], 400);
        }

        // Check for overlapping reservations using RoomReservation model
        $overlapping = RoomReservation::where('room_id', $roomId)
            ->where(function ($query) use ($startTime, $endTime) {
                $query->whereBetween('start_time', [$startTime, $endTime])
                    ->orWhereBetween('end_time', [$startTime, $endTime])
                    ->orWhere(function ($q) use ($startTime, $endTime) {
                        $q->where('start_time', '<=', $startTime)
                            ->where('end_time', '>=', $endTime);
                    });
            })->exists();

        // If overlapping reservation found, return conflict response
        if ($overlapping) {
            return response()->json([
                'message' => 'Room is already reserved during this time.'
            ], 409); // Conflict
        }

        // Create the room reservation with the new fields
        $reservation = RoomReservation::create([
            'room_id' => $roomId,
            'user_id' => Auth::id(), // Ensure user_id is properly set to the authenticated user's ID
            'start_time' => $startTime,
            'end_time' => $endTime,
//            'purpose' => $purpose,
            'room_inventory' => $roomInventory, // Store room_inventory data
            'participant_number' => $participantNumber, // Store participant_number data
            'description' => $description, // Store description data
            'event_type' => $eventType, // Store event_type data
            'status' => 'pending', // Or 'approved' if you don’t want manual approval
        ]);

        return response()->json([
            'message' => 'Room reserved successfully.',
            'reservation' => $reservation
        ], 201);
    }

    public function getReservationLogsByRoomId($room_id)
    {
        // Step 1: Find the room by its ID
        $room = Rooms::find($room_id);

        if (!$room) {
            return response()->json(['message' => 'Room not found'], 404);
        }

        // Step 2: Retrieve all reservations for this room, including the associated user and reservation details
        $reservations = RoomReservation::where('room_id', $room_id)
            ->with('user') // Eager load the user relationship
            ->get();

        // Step 3: Format the logs to match the required structure
        $formattedLogs = $reservations->map(function ($reservation) {
            return [
                'reservation_by' => $reservation->user->name, // Assuming 'name' is the field in the User model
                'day' => Carbon::parse($reservation->start_time)->format('Y-m-d'), // Format day as 'YYYY-MM-DD'
                'datetime_interval' => Carbon::parse($reservation->start_time)->format('H:i') . ' - ' . Carbon::parse($reservation->end_time)->format('H:i'),
            ];
        });

        // Step 4: Return the response with the formatted logs
        return response()->json([
            'success' => true,
            'data' => $formattedLogs
        ]);
    }

    public function getAllReservationLogs(Request $request)
    {
        try {
            // Validate required fields
            $request->validate([
                'start_date' => 'required|date',
                'end_date' => 'required|date|after_or_equal:start_date',
            ]);

            // Get input values
            $buildingID = $request->input('buildingID');
            $roomID = $request->input('roomID');
            $userID = $request->input('userID');
            $startDate = Carbon::parse($request->input('start_date'));
            $endDate = Carbon::parse($request->input('end_date'));

            if (!$buildingID && $roomID) {
                return response()->json([
                    'success' => false,
                    'message' => "Bina id'si boş qoyulduqda otaq id'si daxil edilə bilməz"
                ], 400);
            }

            // Directly check if the building exists
            $mybuilding = $buildingID ? Buildings::find($buildingID) : null;
            if ($buildingID && !$mybuilding) {
                return response()->json(['success' => false, 'message' => 'Building not found'], 404);
            }

            // Check if room exists
            if ($roomID && !Rooms::find($roomID)) {
                return response()->json(['success' => false, 'message' => 'Room not found'], 404);
            }

            // Check if user exists
            if ($userID && !User::find($userID)) {
                return response()->json(['success' => false, 'message' => 'User not found'], 404);
            }

            // Step 2: Initialize the query for RoomReservation
            $query = RoomReservation::with(['room.buildings', 'user'])
                ->where(function ($q) use ($startDate, $endDate) {
                    $q->whereBetween('start_time', [$startDate, $endDate])
                        ->orWhereBetween('end_time', [$startDate, $endDate])
                        ->orWhere(function ($q) use ($startDate, $endDate) {
                            $q->where('start_time', '<=', $startDate)
                                ->where('end_time', '>=', $endDate);
                        });
                });

            // Step 3: Apply additional filters if provided
            if ($buildingID) {
                // Directly filter by building if the building exists
                $query->whereHas('room', function ($q) use ($buildingID) {
                    $q->where('buildings_id', $buildingID);
                });
            }

            if ($roomID) {
                $query->where('room_id', $roomID);
            }

            if ($userID) {
                $query->where('user_id', $userID);
            }

            // Step 4: Execute the query and get the logs
            $reservations = $query->get();



            // Step 5: If no logs are found
            if ($reservations->isEmpty()) {
                return response()->json(['success' => false, 'message' => 'No reservation logs found for the provided filters'], 404);
            }

            // Step 6: Format the data to match the required output with null checks
            $formattedLogs = $reservations->map(function ($reservation) {
                $buildingName = $reservation->room && $reservation->room->buildings ? $reservation->room->buildings->building_name : 'Building not found';
                $buildingID = $reservation->room && $reservation->room->buildings ? $reservation->room->buildings->id : 'N/A';

                return [
                    'room_name'         => $reservation->room ? $reservation->room->room_name : 'Room not found',
                    'reservation_by'    => $reservation->user ? $reservation->user->name : 'User not found',
                    'user_id'           => $reservation->user ? $reservation->user->id : 'N/A',
                    'datetime_interval' => Carbon::parse($reservation->start_time)->format('Y-m-d H:i') . ' - ' . Carbon::parse($reservation->end_time)->format('H:i'),
                    'reservation_id'    => $reservation->id,
                    'building_name'     => $buildingName,
                    'buildingID'        => $buildingID,
                    'roomID'            => $reservation->room ? $reservation->room->id : 'N/A',
                ];
            });

            // Step 7: Return the formatted response
            return response()->json([
                'success' => true,
                'data' => $formattedLogs
            ]);

        } catch (\Exception $e) {
            // Catch any unexpected exceptions
            return response()->json(['success' => false, 'message' => 'An unexpected error occurred: ' . $e->getMessage()], 500);
        }
    }










}

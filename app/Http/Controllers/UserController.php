<?php

namespace App\Http\Controllers;

use App\Models\AccessPoints;
use App\Models\PersonalInformations;
use App\Models\Rooms;
use App\Models\User;
use App\Models\Logs;
use App\Models\GroupPermissions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class UserController extends Controller
{


    public function getUserDatasById($id)
    {
        $user = User::with('personal_informations', 'cards')->find($id);

        if (!$user) {
            return response()->json(['success' => false, 'message' => 'User not found'], 404);
        }

        $user = [
            'id' => $user->id,
            'cardId' => $user->cardId,
            'personal_information' => [
                'fullname' => $user->personal_informations->fullName,
                'uid' => $user->personal_informations->uid,
                'username' => $user->personal_informations->username,
                'birthdate' => $user->personal_informations->birthdate,
                'image' => $user->personal_informations->image,
            ],
            'created_at' => $user->created_at,
            'updated_at' => $user->updated_at,
        ];

        return response()->json(['success' => true, 'data' => $user]);
    }

    public function getUserDatasByUid($uid)
    {
        $user = User::with('personal_informations', 'cards')->where('uid',$uid)->first();

        if (!$user) {
            return response()->json(['success' => false, 'message' => 'User not found'], 404);
        }

        // Transform the data into a nested structure
        $user = [
            'id' => $user->id,
            'cardId' => $user->cardId,
            'personal_information' => [
                'fullname' => $user->fullname,
                'uid' => $user->uid,
                'username' => $user->username,
                'birthdate' => $user->birthdate,
                'image' => $user->image,
            ],
            'created_at' => $user->created_at,
            'updated_at' => $user->updated_at,
        ];

        return response()->json(['success' => true, 'data' => $user]);
    }


    public function store(Request $request)
    {
        $data  = $request->all();
        $request->name;
        $user = User::create($data);
        if(!$user)
        {
            return response()->json(['success' => false, 'message' => 'User not created']);
        }

        $userPersonalInformations = [
            'user_id' => $user->id,
            'uid' => $request->uid,
            'fullName' => $request->fullname,
            'username' => $request->username,
            'birthdate' => $request->birthdate,
            'myRoomID' => $request->myRoomID,
        ];

        $personal_informations = PersonalInformations::create($userPersonalInformations);
        if(!$personal_informations)
        {
            return response()->json(['success' => false, 'message' => 'User created successfully but personal informations not created. Please try again']);
        }

        return response()->json(['success' => true, 'message' => 'User created']);
    }


    private function logAccessAttempt($userId, $accessPointId, $cardId, $action)
    {
        Logs::create([
            'user_id' => $userId,
            'access_point_id' => $accessPointId,
            'card_id' => $cardId,
            'action' => $action
        ]);
    }



    public function validateUid($uid, $accessPointId)
    {
        // Validate UID format (e.g., "1A:10:C8:8B:49:88:04:00:85:00:B4:2E:F0:BB:6A:A8")
        $pattern = '/^([0-9A-Fa-f]{2}:){15}[0-9A-Fa-f]{2}$/';
        if (preg_match($pattern, $uid) !== 1) {
            return response()->json(['success' => false, 'message' => 'Invalid UID format'], 400);
        }

        // Optional: Normalize UID to uppercase for consistency
        $uid = strtoupper($uid);

        // Check if UID exists in PersonalInformations
        $user = PersonalInformations::where('uid', $uid)->first();

        if (!$user) {
            return response()->json(['success' => false, 'message' => 'There is no such card in database'], 404);
        }

        // Step 1: Find the access point by its ID
        $accessPoint = AccessPoints::find($accessPointId);

        if (!$accessPoint) {
            return response()->json(['success' => false, 'message' => 'Access point not found'], 404);
        }

        // Step 2: Find the room associated with the access point's room_id
        $room = Rooms::where('id', $accessPoint->room_id)->first();

        if (!$room) {
            return response()->json(['success' => false, 'message' => 'Room not found for this access point'], 404);
        }

        // Step 3: Load related user and group info
        $user->load(['user', 'user.groups']);

        if (!$user->user) {
            // Log the denied entry attempt (user not found)
            DB::table('logs')->insert([
                'user_id' => 0,
                'access_point_id' => $accessPointId,
                'card_id' => 1,
                'action' => 'entry denied',
                'created_at' => Carbon::now(),
            ]);

            return response()->json(['success' => false, 'message' => 'User not found'], 404);
        }

        // Step 4: Check access permission from group
        $hasAccess = GroupPermissions::where('groups_id', $user->user->group_id)
            ->where('access_points_id', $accessPointId)
            ->exists();

        // Log the access attempt
        DB::table('logs')->insert([
            'user_id' => $user->user_id,
            'access_point_id' => $accessPointId,
            'card_id' => 1,
            'action' => $hasAccess ? 'entry granted' : 'entry denied',
            'created_at' => Carbon::now(),
        ]);

        // Deny if access is not granted
        if (!$hasAccess) {
            return response()->json(['success' => false, 'message' => 'Access denied'], 403);
        }

        // Access granted – return user and room info
        return response()->json([
            'success' => true,
            'data' => [
                'user' => $user,
                'room' => $room,
            ]
        ]);
    }






    public function getAuthenticatedUserUid()
    {
        // Check if the user is authenticated
        if (auth()->check()) {
            // Get the authenticated user's UID from their personal information
            $user = auth()->user();

            // Retrieve the associated personal information for the user
            $personalInformation = $user->personal_informations;

            // Check if the personal information exists and return the UID
            if ($personalInformation) {
                return response()->json(['success' => true, 'uid' => $personalInformation->uid]);
            } else {
                return response()->json(['success' => false, 'message' => 'Personal information not found'], 404);
            }
        }

        // If the user is not authenticated, return a 401 Unauthorized response
        return response()->json(['success' => false, 'message' => 'User not authenticated'], 401);
    }



    public function store1(Request $request)
    {
        try {
            $userId = DB::table('users')->insertGetId([
                'cardId' => $request->cardId,
                'created_at' => now(),
                'updated_at' => null,
            ]);

            // Step 2: Insert into personal_information using the generated userId
            DB::table('personal_information')->insert([
                'userId' => $userId, // Explicitly set userId to avoid error
                'fullname' => $request->fullname,
                'uid' => $request->uid,
                'username' => $request->username,
                'birthdate' => $request->birthdate,
                'image' => $request->profile_image,
                'created_at' => now(),
            ]);

            $user = DB::table('users')
                ->join('personal_information', 'users.id', '=', 'personal_information.userId')
                ->where('users.id', $userId)
                ->select('users.*', 'personal_information.fullname', 'personal_information.uid', 'personal_information.username', 'personal_information.birthdate', 'personal_information.image')
                ->first();

            // Transform the data into a nested structure
            $user = [
                'id' => $user->id,
                'cardId' => $user->cardId,
                'personal_information' => [
                    'fullname' => $user->fullname,
                    'uid' => $user->uid,
                    'username' => $user->username,
                    'birthdate' => $user->birthdate,
                    'image' => $user->image,
                ],
                'created_at' => $user->created_at,
                'updated_at' => $user->updated_at,
            ];

            return response()->json(['success' => true, 'data' => $user]);

        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }

    public function updateById(Request $request, $id)
    {
        try {
            $user = DB::table('users')->where('id', $id)->first();

            if (!$user) {
                return response()->json(['success' => false, 'message' => 'User not found'], 404);
            }

            // Update personal_information
            DB::table('personal_information')
                ->where('userId', $id)
                ->update([
                    'fullname' => $request->fullname,
                    'uid' => $request->uid,
                    'username' => $request->username,
                    'birthdate' => $request->birthdate,
                    'image' => $request->profile_image,
                    'created_at' => $request->created_at ?? now(),
                ]);

            // Update users table
            DB::table('users')
                ->where('id', $id)
                ->update([
                    'updated_at' => now(),
                ]);

            // Fetch the updated user with nested personal information
            $user = DB::table('users')
                ->join('personal_information', 'users.id', '=', 'personal_information.userId')
                ->where('users.id', $id)
                ->select('users.*', 'personal_information.fullname', 'personal_information.uid', 'personal_information.username', 'personal_information.birthdate', 'personal_information.image')
                ->first();

            // Transform the data into a nested structure
            $user = [
                'id' => $user->id,
                'cardId' => $user->cardId,
                'personal_information' => [
                    'fullname' => $user->fullname,
                    'uid' => $user->uid,
                    'username' => $user->username,
                    'birthdate' => $user->birthdate,
                    'image' => $user->image,
                ],
                'created_at' => $user->created_at,
                'updated_at' => $user->updated_at,
            ];

            return response()->json(['success' => true, 'data' => $user]);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }

    public function getUserDatasByUsername($username)
    {
        $user = DB::table('users')
            ->join('personal_information', 'users.id', '=', 'personal_information.userId')
            ->where('personal_information.username', $username)
            ->select('users.*', 'personal_information.fullname', 'personal_information.uid', 'personal_information.username', 'personal_information.birthdate', 'personal_information.image')
            ->first();

        if (!$user) {
            return response()->json(['success' => false, 'message' => 'User not found'], 404);
        }

        // Transform the data into a nested structure
        $user = [
            'id' => $user->id,
            'cardId' => $user->cardId,
            'personal_information' => [
                'fullname' => $user->fullname,
                'uid' => $user->uid,
                'username' => $user->username,
                'birthdate' => $user->birthdate,
                'image' => $user->image,
            ],
            'created_at' => $user->created_at,
            'updated_at' => $user->updated_at,
        ];

        return response()->json(['success' => true, 'data' => $user]);
    }

    public function deleteById($id)
    {
        try {
            $user = DB::table('users')->where('id', $id)->first();

            if (!$user) {
                return response()->json(['success' => false, 'message' => 'User not found'], 404);
            }

            // Delete personal information first
            DB::table('personal_information')->where('userId', $id)->delete();

            // Delete user
            DB::table('users')->where('id', $id)->delete();

            return response()->json(['success' => true, 'message' => 'User deleted successfully']);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }
}

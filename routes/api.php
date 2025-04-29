<?php

use App\Http\Controllers\AccessPointController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\SettingsController;
use App\Http\Controllers\BuildingController;
use App\Http\Controllers\CardController;
use App\Http\Controllers\RoomsController;
use App\Http\Controllers\RoomController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    Route::get('whoEnteredMyRoom', [RoomController::class, 'whoEnteredMyRoom'])
        ->name('whoEnteredMyRoom');

    Route::get('getAuthenticatedUserUid', [UserController::class, 'getAuthenticatedUserUid'])
        ->name('getAuthenticatedUserUid');

    Route::post('reserveRoom', [RoomController::class, 'reserveRoom'])->name('reserveRoom');
});
Route::post('/login_app', [AuthController::class, 'login_app'])->name('login_app');

Route::get('getAllBuildings', [BuildingController::class, 'getAllBuildings'])->name('getAllBuildings');

//admin start
Route::get('getUserDetailedInformation/{user_id}', [DashboardController::class, 'getUserDetailedInformation'])->name('getUserDetailedInformation');
Route::get('getUserRoomAccesses/{user_id}', [DashboardController::class, 'getUserRoomAccesses'])->name('getUserRoomAccesses');
Route::get('getRoomAccessibles/{room_id}', [DashboardController::class, 'getRoomAccessibles'])->name('getRoomAccessibles');
Route::get('getAllUsers', [DashboardController::class, 'getAllUsers'])->name('getAllUsers');


Route::get('getAllRooms', [RoomController::class, 'Index'])->name('getAllRooms');
Route::get('getRoomById/{room_id}', [RoomController::class, 'getRoomById'])->name('getRoomById');
Route::get('getAllRoomsByBuildingId/{building_id}', [RoomController::class, 'getAllRoomsByBuildingId'])->name('getAllRoomsByBuildingId');

// Room Reservation Log Route
Route::get('getReservationLogsByRoomId/{room_id}', [RoomController::class, 'getReservationLogsByRoomId'])->name('getReservationLogsByRoomId');
Route::get('getAllReservationLogs', [RoomController::class, 'getAllReservationLogs'])->name('getAllReservationLogs');


//Route::post('reserveRoom/{room_id}', [RoomController::class, 'reserveRoom'])->name('reserveRoom');


Route::post('updateUserPersonalInformation', [SettingsController::class, 'updateUserPersonalInformation'])->name('updateUserPersonalInformation');
Route::apiResource('rooms', RoomsController::class);

//admin end
Route::get('getAllAccessPoints', [AccessPointController::class, 'index'])->name('getAllAccessPoints');

//users start
Route::get('getUserById/{id}', [UserController::class, 'getUserDatasById']);
Route::get('getUserDatasByUid/{uid}', [UserController::class, 'getUserDatasByUid']);
Route::get('getUserDatasByUsername/{username}', [UserController::class, 'getUserDatasByUsername']);
//
Route::post('createUser', [UserController::class, 'store']);

Route::post('updateUserById/{id}', [UserController::class, 'updateById']);
Route::post('deleteById/{id}', [UserController::class, 'deleteById']);
Route::get('validateUid/{uid}/{accessPointId}', [UserController::class, 'validateUid']);
Route::post('rooms/create', [RoomController::class, 'create']);
//{
//    "buildings_id": 1,
//    "room_name": "Conference Room",
//    "room_type": "Meeting",
//    "room_status": true
//}

Route::delete('rooms/deleteById/{room_id}', [RoomController::class, 'deleteById']);

//users end

//card start
Route::apiResource('cards', CardController::class);
Route::patch('cards/{id}/deactivate', [CardController::class, 'deactivate'])->name('cards.deactivate');
Route::get('cards/{id}/check-validity', [CardController::class, 'checkValidity'])->name('cards.checkValidity');
//card end



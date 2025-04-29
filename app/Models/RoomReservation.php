<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoomReservation extends Model
{
    protected $fillable = [
        'room_id',
        'user_id',
        'description', //
        'event_type', //
        'start_time',
        'end_time',
//        'purpose',
        'room_inventory',
        'participant_number',
    ];


    // Relationship with Room
    public function room()
    {
        return $this->belongsTo(Rooms::class);
    }

    // Relationship with User
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Custom method to get building associated with the room
    public function building()
    {
        return $this->room ? $this->room->building : null;
    }

    // Custom method to get room name directly from the reservation
    public function roomName()
    {
        return $this->room ? $this->room->room_name : 'Room not found';
    }

    // Custom method to get building name directly from the reservation
    public function buildingName()
    {
        return $this->building() ? $this->building()->building_name : 'Building not found';
    }

    // Custom method to get user name directly from the reservation
    public function reservationBy()
    {
        return $this->user ? $this->user->name : 'User not found';
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Buildings;
use Illuminate\Http\Request;

class BuildingController extends Controller
{
    // Get all buildings
    public function getAllBuildings()
    {
        // Fetch all buildings
        $buildings = Buildings::all();

        // Return the response
        return response()->json([
            'success' => true,
            'data' => $buildings
        ]);
    }
}

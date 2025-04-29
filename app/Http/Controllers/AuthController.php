<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login_app(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if (!Auth::attempt($credentials)) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        $user = Auth::user();

        // Retrieve the user's UID from personal_informations
        $personalInformation = $user->personal_informations;

        // If no personal information found, return an error
        if (!$personalInformation) {
            return response()->json(['message' => 'Personal information not found'], 404);
        }

        // Generate the token
        $token = $user->createToken('auth-token')->plainTextToken;

        // Return the token, user data, and UID
        return response()->json([
            'token' => $token,
            'user' => $user,
            'uid' => $personalInformation->uid
        ]);
    }


}

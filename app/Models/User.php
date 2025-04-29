<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'cards_id',
        'group_id',
        'email',
        'name',
        'password',
        'hasException'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function personal_informations()
    {
        return $this->hasOne(PersonalInformations::class);
    }

    public function cards()
    {
        return $this->hasOne(Cards::class);
    }
    public function groups()
    {
        return $this->belongsTo(Groups::class);
    }
    public function has_exceptions()
    {
        return $this->hasMany(HasExceptions::class);
    }

}

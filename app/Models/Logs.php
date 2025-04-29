<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Logs extends Model
{
    use HasFactory;
    protected $table = 'logs';

    public $timestamps = false; // Fix typo

    protected $fillable = [
        'user_id',
        'access_points_id',
        'cards_id',
        'action',
        'created_at',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function access_point()
    {
        return $this->belongsTo(AccessPoints::class);
    }

    public function card()
    {
        return $this->belongsTo(Cards::class);
    }
}

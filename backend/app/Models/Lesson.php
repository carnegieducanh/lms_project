<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    protected $appends = ['video_url'];

    function getVideoUrlAttribute() {
        if ($this->video == "") {
            return "";
        }
        // Cloudinary URL được lưu trực tiếp khi upload
        if (str_starts_with($this->video, 'http://') || str_starts_with($this->video, 'https://')) {
            return $this->video;
        }
        return asset('uploads/course/videos/'.$this->video);
    }
}

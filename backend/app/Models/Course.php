<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    protected $appends = ['course_small_image'];

    function getCourseSmallImageAttribute() {
        if ($this->image == "") {
            return "";
        }
        // Cloudinary: trả về URL thumbnail (750x450 crop)
        if (str_starts_with($this->image, 'https://res.cloudinary.com/')) {
            return str_replace('/upload/', '/upload/w_750,h_450,c_fill/', $this->image);
        }
        if (str_starts_with($this->image, 'http://') || str_starts_with($this->image, 'https://')) {
            return $this->image;
        }
        return asset('uploads/course/small/'.$this->image);
    }
    
    public function chapters() {
        return $this->hasMany(Chapter::class)
            ->orderBy('sort_order','ASC');
    }

    public function outcomes() {
        return $this->hasMany(Outcome::class)
            ->orderBy('sort_order','ASC');
    }

    public function requirements() {
        return $this->hasMany(Requirement::class)
            ->orderBy('sort_order','ASC');
    }
    
    public function level () {
        return $this->belongsTo(Level::class);
    }

    public function category () {
        return $this->belongsTo(Category::class);
    }

    public function language () {
        return $this->belongsTo(Language::class);
    }
   
    public function reviews() {
        return $this->hasMany(Review::class);
    } 

    public function enrollments() {
        return $this->hasMany(Enrollment::class);
    } 


}

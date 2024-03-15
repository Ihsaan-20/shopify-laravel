<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TestingController extends Controller
{
    public function testing()
    {
        // $records = ["a" => "Apple", "b" => "ball", "c" => "cat","d" => "dog", "e" => "elephent", "g" =>"grapes", "h" => "hen", "i" => "iron", "j" => "jet"];
        // // $records = [];        
        // return view('test.test_one', compact('records'));

        // $a = 2;
        // echo 'first => '. ++$a;//3 - 2
        // echo 'second =>'. $a++;//3 - 3  
        // echo 'second =>'. $a++;//4 - 3
        // echo 'third =>'. $a; //2 - 3
        $i = 0;
        for($i=0; $i <= 5; $i++)
        {
            echo 'loop i value '.$i; // 12345
        }

        echo "without loop value $i"; //5
    }
}

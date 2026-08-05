<?php

class ProgramWindow
{
    public $y, $x, $height, $width;

    function __construct(){
        $this->y = 0;
        $this->x = 0;
        $this->height = 600;
        $this->width = 800;
    }

    function resize($size){
        $this->height = $size->height;
        $this->width = $size->width;
    }
    
    function move($position){
        $this->y = $position->y;
        $this->x = $position->x;
    }
}

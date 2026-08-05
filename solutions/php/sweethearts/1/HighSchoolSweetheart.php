<?php

class HighSchoolSweetheart
{
    public function firstLetter(string $name): string
    {
        return substr(trim($name), 0, 1);
    }

    public function initial(string $name): string
    {
        return strtoupper($this->firstLetter($name)).'.';
    }

    public function initials(string $name): string
    {
        $trimmed_name = trim($name);
        $mid_separator = strpos($trimmed_name, ' ');
        $first_name = substr($trimmed_name, 0, $mid_separator);
        $last_name = substr($trimmed_name, $mid_separator + 1);
        return $this->initial($first_name).' '.$this->initial($last_name);
    }

    public function pair(string $sweetheart_a, string $sweetheart_b): string
    {
        $combined_initials = $this->initials($sweetheart_a).'  +  '.$this->initials($sweetheart_b);
        return '     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     '.$combined_initials.'     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *';
    }
}

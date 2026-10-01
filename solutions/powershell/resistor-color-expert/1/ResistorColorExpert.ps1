Function Get-ResistorLabel() {
    <#
    .SYNOPSIS
    Implement a function to get the label of a resistor from its color-coded bands.

    .DESCRIPTION
    Given an array of 1, 4 or 5 colors from a resistor, decode their resistance values and return a string represent the resistor's label.

    .PARAMETER Colors
    The array represent the colors from left to right.

    .EXAMPLE
    Get-ResistorLabel -Colors @("red", "black", "green", "red")
    Return: "2 megaohms ±2%"

    Get-ResistorLabel -Colors @("blue", "blue", "blue", "blue", "blue")
    Return: "666 megaohms ±0.25%"
     #>
    [CmdletBinding()]
    Param(
        [string[]]$Colors
    )
    
    $allvalues=@('black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white')
    $alltolerances=@{
        "grey"=' ±0.05%'
        "violet"=' ±0.1%'
        "blue"=' ±0.25%'
        "green"=' ±0.5%'
        "brown"=' ±1%'
        "red"=' ±2%'
        "gold"=' ±5%'
        "silver"=' ±10%'
    }
    $color_count=$colors.count
    switch($color_count) {
        1 {
            $color=$colors[0]
            if($color -eq 'black'){
                return("0 ohms")
            }
            throw "One-band resistors should be black. This one was $color."
        }
        4 {
            $m=0
        }
        5 {
            $m=100
        }
        default {
            throw "Expected number of arguments: 1, 4, or 5. Received number of arguments: $color_count."
        }
    }
    For($i=0; $i -le $color_count - 1; $i++){
        if(-not $allvalues.contains($colors[$i])) {
            $i=$color_count - 1
            throw "Please choose the first $i colours from the following:\n$allvalues"
        }
    }
    if(-not $alltolerances.Keys.contains($colors[$color_count - 1])) {
        throw "Please choose the last colour from the following:\n$alltolerances"
    }
    $value=0
    $value=$m*$allvalues.indexof($colors[0])
    $tolerance=$alltolerances[$colors[$color_count - 1]]
    $tens_digit=$color_count - 4
    $value+=10*$allvalues.indexof($colors[$tens_digit]) + $allvalues.indexof($colors[$tens_digit+1])
    $value*=[math]::Pow(10, $allvalues.indexof($colors[$tens_digit+2]))
    if($value -eq 0){
        return("0 ohms")
    }
    if($value -ge 1000000000){
        $value/=1000000000
        $unit="gigaohm"
    }elseif($value -ge 1000000){
        $value/=1000000
        $unit="megaohm"
    }elseif($value -ge 1000){
        $value/=1000
        $unit="kiloohm"
    }else{
        $unit="ohm"
    }
    if($value -ne 1){
        $unit+="s"
    }
    $resistance=$value.ToString()+" "+$unit
    $resistance+$tolerance
}
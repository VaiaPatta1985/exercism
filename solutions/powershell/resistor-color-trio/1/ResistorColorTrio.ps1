Function Get-ResistorLabel() {
    <#
    .SYNOPSIS
    Implement a function to get the label of a resistor with three color-coded bands.

    .DESCRIPTION
    Given an array of colors from a resistor, decode their resistance values and return a string represent the resistor's label.

    .PARAMETER Colors
    The array repesent the 3 colors from left to right.

    .EXAMPLE
    Get-ResistorLabel -Colors @("red", "white", "blue")
    Return: "29 megaohms"
     #>
    [CmdletBinding()]
    Param(
        [string[]]$Colors
    )

    $allColors=@('black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white')
    if ($allcolors.contains($colors[0]) -and $allcolors.contains($colors[1]) -and $allcolors.contains($colors[2])){
        $value=(10*$allcolors.indexof($colors[0])+$allcolors.indexof($colors[1]))*[math]::Pow(10, $allcolors.indexof($colors[2]))
        if($value -eq 0){
            return("0 ohms")
        }
        if($value%1000000000 -eq 0){
            $value/=1000000000
            $unit="gigaohm"
        }elseif($value%1000000 -eq 0){
            $value/=1000000
            $unit="megaohm"
        }elseif($value%1000 -eq 0){
            $value/=1000
            $unit="kiloohm"
        }else{
            $unit="ohm"
        }
        if($value -ne 1){
            $unit+="s"
        }
        return($value.ToString()+" "+$unit)
    }else{
        throw "please choose from the following colours:\n$allColors"
    }
}
Function Invoke-ArmstrongNumbers() {
    <#
    .SYNOPSIS
    Determine if a number is an Armstrong number.

    .DESCRIPTION
    An Armstrong number is a number that is the sum of its own digits each raised to the power of the number of digits.

    .PARAMETER Number
    The number to check.

    .EXAMPLE
    Invoke-ArmstrongNumbers -Number 12
    #>
    [CmdletBinding()]
    Param(
        [Int64]$Number
    )
    $digits=@()
    $test=$number
    while($test -ne 0){
        $digit=$test%10
        $digits+=$digit
        $test=($test-$digit)/10
    }
    $pwr=$digits.count
    $result=0
    foreach($digit in $digits){
        $result+=[math]::pow($digit, $pwr)
    }
    $result -eq $number
}

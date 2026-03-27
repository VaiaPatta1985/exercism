Function Get-ColorCodeValue() {
    <#
    .SYNOPSIS
    Translate a list of colors to their corresponding color code values.

    .DESCRIPTION
    Given 2 colors, take the first one and times it by 10 and add the second color to it.

    .PARAMETER Colors
    The colors to translate to their corresponding color codes.

    .EXAMPLE
    Get-ColorCodeValue -Colors @("black", "brown")
    #>
    [CmdletBinding()]
    Param(
        [string[]]$Colors
    )
    
    $allColors=@('black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white')
    if ($allcolors.contains($colors[0]) -and $allcolors.contains($colors[1])){
        return(10*$allcolors.indexof($colors[0])+$allcolors.indexof($colors[1]))
    }else{
        throw "please choose from the following colours:\n$allColors"
    }
}

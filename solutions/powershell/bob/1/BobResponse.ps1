Function Get-BobResponse() {
    <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    
    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.
    
    .PARAMETER HeyBob
    The sentence you say to Bob.
    
    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )

    Switch -Regex -CaseSensitive ("$HeyBob") {
        '^[\s0-9_\W]*[A-Z][A-Z\s_0-9\W]*\?\s*$'{
            "Calm down, I know what I'm doing!"
            continue
        }
        '\?\s*$'{
            'Sure.'
            continue
        }
        '^[\s_0-9\W]*[A-Z][A-Z\s_0-9\W]*$'{
            'Whoa, chill out!'
            continue
        }
        '^\s*$'{
            'Fine. Be that way!'
        }
        default{
            'Whatever.'
        }
    }
}

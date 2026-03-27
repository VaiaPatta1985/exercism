Public Class Bob

  private function is_all_caps(statement as string) as integer
        dim letter as string
        dim code as integer
        dim contains_caps as integer
        dim contains_noncaps as integer
        for idx=0 to len(statement)-1
            letter=statement(idx)
            code=asc(letter)
            contains_caps=contains_caps or (code>=asc("A") and code<=asc("Z"))
            contains_noncaps=contains_noncaps or (code>=asc("a") and code<=asc("z"))
        next idx
        return contains_caps and (not contains_noncaps)
  end function

    private Function strip(statement As String) As String
        dim stripped_statement as string
        dim letter as string
        stripped_statement=""
        for idx=0 to len(statement)-1
            letter=statement(idx)
            if letter<>" " then
                stripped_statement=stripped_statement+letter
            end if
        next idx
        return stripped_statement
    End Function

    Public Function Hey(statement As String) As String
        dim stripped_statement as string
        dim yelled as integer
        stripped_statement=""
        if statement<>"" then
            stripped_statement=strip(statement)
        end if
        if stripped_statement="" then
            return "Fine. Be that way!"
        end if
        yelled=is_all_caps(stripped_statement)
        if stripped_statement(len(stripped_statement)-1)="?" then
            if yelled then
                return "Calm down, I know what I'm doing!"
            end if
            return "Sure."
        end if
        if yelled then
            return "Whoa, chill out!"
        end if
        return "Whatever."
    End Function
End Class
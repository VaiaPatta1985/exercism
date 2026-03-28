Public Module Atbash
  Public Function Encode(arg As String) As String
    dim return_string as string
    dim rs as string
    dim coded_length_wo_spaces as integer
    rs=""
    return_string=arg
    for i=32 to 47
      return_string=return_string.replace(chr(i),"")
    next i
    for i=58 to 64
      return_string=return_string.replace(chr(i),"")
    next i
    for i=65 to 90
      return_string=return_string.replace(chr(i),chr(i+32))
    next i
    for i=91 to 96
      return_string=return_string.replace(chr(i),"")
    next i
    for i=97 to 122
      return_string=return_string.replace(chr(i),chr(187-i))
    next i
    for i=123 to 126
      return_string=return_string.replace(chr(i),"")
    next i
    for i=65 to 90
      return_string=return_string.replace(chr(i),chr(i+32))
    next i
    coded_length_wo_spaces=return_string.length
    if coded_length_wo_spaces then
      rs=rs+return_string(0)
      for i=1 to coded_length_wo_spaces-1
        if (i mod 5)=0 then rs=rs+" "
        rs=rs+return_string(i)
      next i
    end if
    return rs
  End Function

  Public Function Decode(arg As String) As String
    dim return_string as string
    return_string=arg.replace(" ","")
    for i=0 to 25
      return_string=return_string.replace(chr(97+i),chr(90-i))
    next i
    for i=0 to 25
      return_string=return_string.replace(chr(65+i),chr(97+i))
    next i
    return return_string
  End Function
End Module
Public Class Anagram
  dim target as string
  dim target_low as string
  dim target_low_sorted as string
  dim target_length as integer

  Public Sub New(baseWord As String)
    target=baseWord
    target_length=target.length
    dim target_chararray(target_length) as char
    target_low=target.tolower()
    target_chararray=target_low.tochararray()
    Array.sort(target_chararray)
    target_low_sorted=new string(target_chararray)
  End Sub

  Public Function Match(potentialMatches As String()) As String()
    dim num_of_candidates as integer
    dim candidate as string
    dim candidate_low as string
    dim c_length as integer
    dim c_chararray() as char
    dim candidate_low_sorted as string
    dim num_of_matches as integer
    num_of_candidates=potentialMatches.length
    dim matches(num_of_candidates-1) as string
    num_of_matches=0
    for idx=0 to num_of_candidates-1
      candidate=potentialMatches(idx)
      candidate_low=candidate.tolower()
      c_length=candidate.length
      if target_length=c_length and target_low<>candidate_low then
        c_chararray=candidate_low.tochararray()
        Array.sort(c_chararray)
        candidate_low_sorted=new string(c_chararray)
        if target_low_sorted=candidate_low_sorted then
          matches(num_of_matches)=candidate
          num_of_matches=num_of_matches+1
        end if
      end if
    next idx
    if num_of_matches then
      dim m(num_of_matches-1) as string
      for i=0 to num_of_matches-1
        m(i)=matches(i)
      next i
      Array.sort(m)
      return m
    else
      return {}
    end if
  End Function
End Class
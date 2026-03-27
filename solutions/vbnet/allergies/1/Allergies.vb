Public Class Allergies
    dim allergy_list As IList(Of String)
    dim num_of_allergies as integer
    dim allergy_score as integer

    Public Sub New(score As Integer)
      allergy_list={"eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"}
      num_of_allergies=allergy_list.count
      allergy_score=score mod 2^(num_of_allergies)
    End Sub

    Public Function AllergicTo(allergy As String) As Boolean
      dim allergy_value as integer
      allergy_value=-1
      for allergy_index=0 to num_of_allergies-1
        if allergy_list(allergy_index)=allergy then
          allergy_value=allergy_index
          allergy_index=num_of_allergies-1
        end if
      next allergy_index
      if allergy_value=-1 then
        Throw new Exception("We have no information on this allergy.")
      end if
      return math.floor((allergy_score mod 2^(allergy_value+1))/2^allergy_value)
    End Function

    Public Function List() As IList(Of String)
      dim list_to_return(num_of_allergies) as string
      dim test_number as integer
      dim k as integer
      k=0
      test_number=allergy_score
      for allergy_index=0 to num_of_allergies-1
        if test_number mod 2
          list_to_return(k)=allergy_list(allergy_index)
          k=k+1
          test_number=test_number-1
        end if
        test_number=test_number/2
      next allergy_index
      if k then
        dim ltr(k-1) as string
        for i=0 to k-1
          ltr(i)=list_to_return(i)
        next i
        return ltr
      else
        return {}
      end if
    End Function
End Class
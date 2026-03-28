Imports System

Public Module ArmstrongNumbers
  Public Function IsArmstrongNumber(ByVal number As Integer) As Boolean
    dim number_of_digits as integer
    dim sum_of_stuff as integer
    dim test_number as integer
    sum_of_stuff=0
    number_of_digits=1
    test_number=math.floor(number/10)
    while test_number
      number_of_digits=number_of_digits+1
      test_number=math.floor(test_number/10)
    end while
    test_number=number
    for digit=0 to number_of_digits-1
      sum_of_stuff=sum_of_stuff+(test_number mod 10)^number_of_digits
      test_number=math.floor(test_number/10)
    next digit
    return sum_of_stuff=number
  End Function
End Module

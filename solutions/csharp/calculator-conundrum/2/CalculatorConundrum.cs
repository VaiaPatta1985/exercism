public static class SimpleCalculator
{
    public static string Calculate(int operand1, int operand2, string? operation)
    {
        int result;
        if (operation == null) throw new ArgumentNullException();
        switch(operation){
            case "+":
                result = SimpleOperation.Addition(operand1, operand2);
                break;
            case "*":
                result = SimpleOperation.Multiplication(operand1, operand2);
                break;
            case "/":
                try{
                    result = SimpleOperation.Division(operand1, operand2);
                }catch(DivideByZeroException){
                    return "Division by zero is not allowed.";
                }
                break;
            case "":
                throw new ArgumentException();
            default:
                throw new ArgumentOutOfRangeException();
        }
        return $"{operand1} {operation} {operand2} = {result}";
    }
}

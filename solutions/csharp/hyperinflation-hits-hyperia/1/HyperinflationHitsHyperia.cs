public static class CentralBank
{
    public static string DisplayDenomination(long @base, long multiplier)
    {
        long result;
        try{
            result = checked(@base * multiplier);
        }catch(OverflowException){
            return "*** Too Big ***";
        }
        return result.ToString();
    }

    public static string DisplayGDP(float @base, float multiplier)
    {
        float result = @base * multiplier;
        if (result == float.PositiveInfinity) return "*** Too Big ***";
        return result.ToString();
    }

    public static string DisplayChiefEconomistSalary(decimal salaryBase, decimal multiplier)
    {
        decimal result;
        try{
            result = salaryBase * multiplier;
        }catch(OverflowException){
            return "*** Much Too Big ***";
        }
        return result.ToString();
    }
}

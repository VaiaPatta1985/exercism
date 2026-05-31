public static class LineUp
{
    public static string Format(string name, int number)
    {
        string suffix = "th";
        int[] weird_numbers = {11, 12, 13};
        if (!(weird_numbers.Contains(number%100))) suffix = (number%10) switch {
            1 => "st",
            2 => "nd",
            3 => "rd",
            _ => "th"
        };
        return $"{name}, you are the {number}{suffix} customer we serve today. Thank you!";
    }
}

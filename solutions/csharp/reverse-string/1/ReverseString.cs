public static class ReverseString
{
    public static string Reverse(string input)
    {
        char[] letters = input.ToCharArray();
        string result = "";
        foreach (char letter in letters) result = new String(letter, 1) + result;
        return result;
    }
}
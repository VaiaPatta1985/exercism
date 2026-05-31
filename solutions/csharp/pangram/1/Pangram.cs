public static class Pangram
{
    public static bool IsPangram(string input)
    {
        List<char> letters = new List<char>();
        for(char letter = 'a'; letter <= 'z'; letter++) letters.Add(letter);
        return Array.TrueForAll(letters.ToArray(), input.ToLower().ToCharArray().Contains);
    }
}

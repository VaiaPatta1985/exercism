public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        char[] letters = word.ToLower().ToCharArray();
        int index = 0;
        int length = word.Length;
        letters.Sort();
        while (index < length) {
            if (letters[index] >= 'a') break;
            index++;
        }
        while (index < length - 1) {
            if (letters[index] > 'z') return true;
            if (letters[index] == letters[index + 1]) return false;
            index++;
        }
        return true;
    }
}

public static class RotationalCipher
{
    public static char Cipher(char letter, int shiftKey) {
        if (letter >= 'a' && letter <= 'z') return (char)((letter - 'a' + shiftKey) % 26 + 'a');
        if (letter >= 'A' && letter <= 'Z') return (char)((letter - 'A' + shiftKey) % 26 + 'A');
        return letter;
    }
    
    public static string Rotate(string text, int shiftKey)
    {
        string result = "";
        int length = text.Length;
        char[] letters = text.ToCharArray();
        foreach (char letter in letters) result = result + new String(Cipher(letter, shiftKey), 1);
        return result;
    }
}
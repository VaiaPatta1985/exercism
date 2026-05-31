public static class Acronym
{
    public static string Abbreviate(string phrase)
    {
        string acronym = "";
        string words = phrase.ToUpper();
        
        foreach (string compound in words.Split(' ')) {
            foreach (string word in compound.Split('-')){
                foreach (char letter in word.ToCharArray()) {
                    if (letter >= 'A' && letter <= 'Z') {
                        acronym = acronym + new String(letter, 1);
                        break;
                    }
                }
            }
        }
        return acronym;
    }
}

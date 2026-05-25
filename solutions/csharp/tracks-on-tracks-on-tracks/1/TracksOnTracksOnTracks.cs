public static class Languages
{
    public static List<string> NewList() => new List<string>();

    public static List<string> GetExistingLanguages() => new List<string> {"C#", "Clojure", "Elm"};

    public static List<string> AddLanguage(List<string> languages, string language)
    {
        List <string> updated_languages = languages.ToList();
        updated_languages.Add(language);
        return updated_languages;
    }

    public static int CountLanguages(List<string> languages) => languages.Count;

    public static bool HasLanguage(List<string> languages, string language) => languages.Contains(language);

    public static List<string> ReverseList(List<string> languages)
    {
        List <string> updated_languages = languages.ToList();
        updated_languages.Reverse();
        return updated_languages;
    }

    public static bool IsExciting(List<string> languages)
    {
        int number_of_languages = languages.Count;
        if (number_of_languages == 0) return false;
        if (languages[0].Equals("C#")) return true;
        if (number_of_languages == 2 || number_of_languages == 3) return languages[1].Equals("C#");
        return false;
    }

    public static List<string> RemoveLanguage(List<string> languages, string language)
    {
        List <string> updated_languages = languages.ToList();
        updated_languages.Remove(language);
        return updated_languages;
    }

    public static bool IsUnique(List<string> languages)
    {
        int number_of_languages = languages.Count;
        languages.Sort();
        for(int idx = 0;idx < languages.Count - 1;idx++){
            if (languages[idx].Equals(languages[idx+1])) return false;
        }
        return true;
    }
}

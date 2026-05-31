public static class Bob
{
    public static string Response(string statement)
    {
        bool isQuestion = statement.Trim().EndsWith("?");
        bool isLoud = statement.Equals(statement.ToUpper()) && !(statement.Equals(statement.ToLower()));
        if (System.Text.RegularExpressions.Regex.IsMatch(statement, @"\S")) {
            if (isQuestion) {
                if (isLoud) return "Calm down, I know what I'm doing!";
                return "Sure.";
            }
            if (isLoud) return "Whoa, chill out!";
            return "Whatever.";
        }
        return "Fine. Be that way!";
    }
}
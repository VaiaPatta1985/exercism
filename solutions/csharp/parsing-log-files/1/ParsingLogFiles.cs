using System.Text.RegularExpressions;

public class LogParser
{
    public bool IsValidLine(string text) => Regex.IsMatch(text, @"^\[(TRC|DBG|INF|WRN|ERR|FTL)\]");

    public string[] SplitLogLine(string text) => Regex.Split(text, @"<[\^\*=-]+>");

    public int CountQuotedPasswords(string lines) => Regex.Matches(lines, "\"[^\"]*password[^\"]*\"", RegexOptions.IgnoreCase).Count;

    public string RemoveEndOfLineText(string line) => Regex.Replace(line, "end-of-line[0-9]+", "");

    public string[] ListLinesWithPasswords(string[] lines)
    {
        List<string> result_list = new List<string>();
        int number_of_lines = lines.Length;
        string line;
        string prefix;
        Match match;
        // do I assume at most one bad password per line?
        // ignore case?
        // "password" doesn't count?
        // and every word is a password?
        for (int line_number = 0; line_number < number_of_lines; line_number++) {
            line = lines[line_number];
            match = Regex.Match(line, @"(^|\s)password\S+($|\s)", RegexOptions.IgnoreCase);
            prefix = match.Success ? match.Value.Trim() : "--------";
            result_list.Add($"{prefix}: {line}");
        }
        return result_list.ToArray();
    }
}

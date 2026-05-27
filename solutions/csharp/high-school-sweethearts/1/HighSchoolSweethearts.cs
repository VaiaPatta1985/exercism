public static class HighSchoolSweethearts
{
    public static string DisplaySingleLine(string studentA, string studentB)
    {
        return $"{studentA,29} ♡ {studentB,-29}";
    }

    public static string DisplayBanner(string studentA, string studentB)
    {
        string[] sAsplit = studentA.Split(' ');
        string[] sBsplit = studentB.Split(' ');
        return @"
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     "+$"{sAsplit[0],1} {sAsplit[1],1}  +  {sBsplit[0],1} {sBsplit[1],1}"+@"     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
";
    }

    public static string DisplayGermanExchangeStudents(string studentA
        , string studentB, DateTime start, float hours)
    {
        return String.Format(new System.Globalization.CultureInfo("de-DE"), "{0} and {1} have been dating since {2:d} - that's {3:n2} hours", studentA, studentB, start, hours);
    }
}

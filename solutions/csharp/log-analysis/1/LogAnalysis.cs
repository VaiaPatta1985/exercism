public static class LogAnalysis 
{
    public static string SubstringAfter(this string logLine, string delimiter) => logLine.Substring(logLine.IndexOf(delimiter) + delimiter.Length);

    public static string SubstringBetween(this string logLine, string delimiter_before, string delimiter_after){
        int loglevel_start = logLine.IndexOf(delimiter_before) + delimiter_before.Length;
        return logLine.Substring(loglevel_start, logLine.IndexOf(delimiter_after) - loglevel_start);
    }
    
    public static string Message(this string logLine) => logLine.SubstringAfter(":").Trim();

    public static string LogLevel(this string logLine) => logLine.SubstringBetween("[", "]");
}
public static class PlayAnalyzer
{
    public static string[] players = {"UNKNOWN", "goalie", "left back", "center back", "center back", "right back", "midfielder", "midfielder", "midfielder", "left wing", "striker", "right wing"};
    public static string AnalyzeOnField(int shirtNum) => shirtNum > 11 ? players[0] : players[shirtNum];

    public static string AnalyzeOffField(object report)
    {
        string club_part = "";
        string club;
        switch (report) {
            case int:
                return $"There are {report} supporters at the match.";
            case string:
                return report.ToString();
            case Injury:
                return $"Oh no! {((Injury) report).GetDescription()} Medics are on the field.";
            case Incident:
                return ((Incident) report).GetDescription();
            case Manager:
                club = ((Manager) report).Club;
                if (club != null) club_part = $" ({club})";
                return $"{((Manager) report).Name}{club_part}";
        }
        return "";
    }
}

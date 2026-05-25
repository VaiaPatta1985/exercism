static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        string owner_title = "OWNER";
        string id_part = "";
        if (id != null) {
            id_part = $"[{id}] - ";
        }
        return $"{id_part}{name} - {department?.ToUpper() ?? owner_title}";
    }
}

public static class Identifier
{
    public static string Clean(string identifier)
    {
        string result;
        int index = 0;
        char current_char;
        
        if (identifier.Equals("")) return "";
        result = identifier.Replace(' ', '_');
        while (index < result.Length) {
            current_char = result[index];
            if (char.IsControl(current_char)) {
                result = result.Replace(current_char.ToString(), "CTRL");
                index += 3;
            }
            index++;
        }
        index = 1;
        while (index < result.Length) if(result[index - 1] == '-') result = result.Replace("-" + result[index].ToString(), char.ToUpperInvariant(result[index]).ToString()); else index++;
        index = 0;
        while (index < result.Length) {
            current_char = result[index];
            if (!char.IsLetter(current_char) && current_char != '_') result = result.Remove(index, 1); else index++;
        }
        index = 0;
        while (index < result.Length) {
            current_char = result[index];
            if (current_char >= 'α' && current_char <= 'ω') result = result.Remove(index, 1); else index++;
        }
        return result;
    }
}

public static class PhoneNumber
{
    public static (bool IsNewYork, bool IsFake, string LocalNumber) Analyze(string phoneNumber)
    {
        string area_code = phoneNumber.Substring(0, 3);
        string prefix = phoneNumber.Substring(4, 3);
        string main_part = phoneNumber.Substring(8, 4);
        return (area_code.Equals("212"), prefix.Equals("555"), main_part);
    }

    public static bool IsFake((bool IsNewYork, bool IsFake, string LocalNumber) phoneNumberInfo) => phoneNumberInfo.IsFake;
}

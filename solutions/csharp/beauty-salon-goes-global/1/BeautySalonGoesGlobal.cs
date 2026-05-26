public enum Location
{
    NewYork,
    London,
    Paris
}

public enum AlertLevel
{
    Early,
    Standard,
    Late
}

public static class Appointment
{
    public static DateTime ShowLocalTime(DateTime dtUtc) => TimeZoneInfo.ConvertTimeFromUtc(dtUtc, TimeZoneInfo.Local);

    static string GetTimeZoneId(Location location){
        bool running_windows = System.Runtime.InteropServices.RuntimeInformation.IsOSPlatform(System.Runtime.InteropServices.OSPlatform.Windows);
        switch(location){
            case Location.NewYork:
                return running_windows ? "Eastern Standard Time" : "America/New_York";
            case Location.London:
                return running_windows ? "GMT Standard Time" : "Europe/London";
            case Location.Paris:
                return running_windows ? " W. Europe Standard Time" : "Europe/Paris";
            default:
                return "";
        }
    }

    public static DateTime Schedule(string appointmentDateDescription, Location location) => TimeZoneInfo.ConvertTimeToUtc(DateTime.Parse(appointmentDateDescription), TimeZoneInfo.FindSystemTimeZoneById(GetTimeZoneId(location)));

    public static DateTime GetAlertTime(DateTime appointment, AlertLevel alertLevel)
    {
        switch(alertLevel){
            case AlertLevel.Early:
                return appointment.Subtract(new TimeSpan(1, 0, 0, 0));
            case AlertLevel.Standard:
                return appointment.Subtract(new TimeSpan(0, 1, 45, 0));
            case AlertLevel.Late:
                return appointment.Subtract(new TimeSpan(0, 0, 30, 0));
            default:
                return appointment;
        }
    }

    public static bool HasDaylightSavingChanged(DateTime dt, Location location)
    {
        TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(GetTimeZoneId(location));
        return timeZoneInfo.IsDaylightSavingTime(dt) != timeZoneInfo.IsDaylightSavingTime(dt.Subtract(new TimeSpan(7, 0, 0, 0)));
    }

    public static DateTime NormalizeDateTime(string dtStr, Location location) {
        DateTime result;
        string culture_id;
        switch(location){
            case Location.NewYork:
                culture_id = "en-US";
                break;
            case Location.London:
                culture_id = "en-GB";
                break;
            case Location.Paris:
                culture_id = "fr-FR";
                break;
            default:
                culture_id = "";
                break;
        }
        return DateTime.TryParse(dtStr, new 
System.Globalization.CultureInfo(culture_id).DateTimeFormat, out result) ? result : new DateTime(1, 1, 1, 0, 0, 0) ;
    }
}

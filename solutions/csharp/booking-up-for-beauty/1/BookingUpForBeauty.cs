static class Appointment
{
    public static DateTime Schedule(string appointmentDateDescription) => DateTime.Parse(appointmentDateDescription);

    public static bool HasPassed(DateTime appointmentDate) => appointmentDate.ToUniversalTime().CompareTo(DateTime.UtcNow) < 0;

    public static bool IsAfternoonAppointment(DateTime appointmentDate) => appointmentDate.Hour < 18 && appointmentDate.Hour >=12;

    public static string Description(DateTime appointmentDate) => $"You have an appointment on {appointmentDate.ToString()}.";

    public static DateTime AnniversaryDate() => new DateTime(DateTime.Now.Year, 9, 15, 0, 0, 0);
}

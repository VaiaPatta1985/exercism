static class AssemblyLine
{

    public static double BaseProductionRatePerHour() => 221.0;
    public static double SuccessRate(int speed)
    {
        if (speed == 0) return 0.0;
        if (speed < 5) return 1.0;
        if (speed < 9) return 0.9;
        if (speed == 9) return 0.8;
        return 0.77;
    }
    
    public static double ProductionRatePerHour(int speed) => SuccessRate(speed) * speed * BaseProductionRatePerHour();

    public static int WorkingItemsPerMinute(int speed) => (int) (ProductionRatePerHour(speed) / 60);
}

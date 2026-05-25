class BirdCount
{
    private int[] birdsPerDay;

    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }

    public static int[] LastWeek() {
        int[] result = {0, 2, 5, 3, 7, 8, 4};
        return result;
    }

    public int Today() => birdsPerDay[birdsPerDay.Length - 1];

    public void IncrementTodaysCount()
    {
        int lastDayIndex = birdsPerDay.Length - 1;

        birdsPerDay[lastDayIndex] = birdsPerDay[lastDayIndex] + 1;
    }

    public bool HasDayWithoutBirds() => !(Array.TrueForAll(birdsPerDay, number => number > 0));

    public int CountForFirstDays(int numberOfDays)
    {
        int count = 0;
        for(int idx = 0;idx<numberOfDays;idx++){
            count += birdsPerDay[idx];
        }
        return count;
    }

    public int BusyDays() => Array.FindAll(birdsPerDay, number => number >= 5).Length;
}

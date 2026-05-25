class Lasagna
{
    public int ExpectedMinutesInOven() => 40;

    public int RemainingMinutesInOven(int actual_minutes_in_oven) => ExpectedMinutesInOven() - actual_minutes_in_oven;

    public int PreparationTimeInMinutes(int layers) => 2 * layers;

    public int ElapsedTimeInMinutes(int layers, int actual_minutes_in_oven) => PreparationTimeInMinutes(layers) + actual_minutes_in_oven;
}

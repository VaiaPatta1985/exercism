class Lasagna
{
    public int ExpectedMinutesInOven() => 40;

    public int RemainingMinutesInOven(int actual_minutes_in_oven){
        return ExpectedMinutesInOven() - actual_minutes_in_oven;
    }

    public int PreparationTimeInMinutes(int layers){
        return 2*layers;
    }

    public int ElapsedTimeInMinutes(int layers, int actual_minutes_in_oven){
        return PreparationTimeInMinutes(layers)+actual_minutes_in_oven;
    }
}

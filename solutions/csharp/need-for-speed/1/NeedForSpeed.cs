class RemoteControlCar
{
    int _speed;
    int _batteryDrain;
    int _distance;
    int _battery = 100;
    
    public RemoteControlCar(int speed, int batteryDrain){
        _speed = speed;
        _batteryDrain = batteryDrain;
    }

    public bool BatteryDrained() => _battery < _batteryDrain;

    public int DistanceDriven() => _distance;

    public void Drive()
    {
        if (!BatteryDrained()) {
            _battery = _battery - _batteryDrain;
            _distance = _distance + _speed;
        }
    }

    public static RemoteControlCar Nitro() => new RemoteControlCar(50, 4);
}

class RaceTrack
{
    int _distance;
    
    public RaceTrack(int distance){
        _distance = distance;
    }

    public bool TryFinishTrack(RemoteControlCar car)
    {
        while (!(car.BatteryDrained()) && car.DistanceDriven() < _distance){
            car.Drive();
        }
        return car.DistanceDriven() >= _distance;
    }
}

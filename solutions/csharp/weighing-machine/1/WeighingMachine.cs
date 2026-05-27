class WeighingMachine
{
    public WeighingMachine(int precision){
        Precision = precision;
    }
    public int Precision { get; private set; }
    private double weight;
    public double Weight {
        get { return weight; }
        set {
            if (value < 0) throw new ArgumentOutOfRangeException();
            weight = value;
        }
    }
    public double TareAdjustment { get; set; } = 5;

    public string DisplayWeight {
        get {
            
            string result = (Weight - TareAdjustment).ToString($"F{Precision}");
            return $"{result} kg";
        }
    }
    
}

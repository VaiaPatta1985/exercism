public struct CurrencyAmount//: IComparable
{
    private decimal amount;
    private string currency;

    public decimal Amount { get => this.amount; private set;}
    public string Currency { get => this.currency; private set;}

    public CurrencyAmount(decimal amount, string currency)
    {
        this.amount = amount;
        this.currency = currency;
    }

    public override bool Equals(Object other_object){
        if (other_object is CurrencyAmount other) if(other.Currency.Equals(Currency)){
            return Amount == other.Amount;
        }
        throw new ArgumentException();
    }

    public static bool operator ==(CurrencyAmount first, CurrencyAmount second) => first.Equals((Object) second);
    public static bool operator !=(CurrencyAmount first, CurrencyAmount second) => !(first == second);
/*
    public int CompareTo(Object other_object){
        if (other_object is CurrencyAmount other) if(other.Currency.Equals(Currency)){
            return (int) (Amount - other.Amount);
        }
        throw new ArgumentException();
    }

    public static bool operator >(CurrencyAmount first, CurrencyAmount second) => first.CompareTo((Object) second) >= 0;
    public static bool operator <(CurrencyAmount first, CurrencyAmount second) => first.CompareTo((Object) second) <= 0;
    */
    public static bool operator >(CurrencyAmount first, CurrencyAmount second) {
        if (first.Currency.Equals(second.Currency)) return first.Amount > second.Amount;
        throw new ArgumentException();
    }
    public static bool operator <(CurrencyAmount first, CurrencyAmount second) {
        if (first.Currency.Equals(second.Currency)) return first.Amount < second.Amount;
        throw new ArgumentException();
    }
    
    public static CurrencyAmount operator -(CurrencyAmount first, CurrencyAmount second) {
        if (first.Currency.Equals(second.Currency)) return new CurrencyAmount(first.Amount - second.Amount, first.Currency);
        throw new ArgumentException();
    }
    public static CurrencyAmount operator +(CurrencyAmount first, CurrencyAmount second) {
        if (first.Currency.Equals(second.Currency)) return new CurrencyAmount(first.Amount + second.Amount, first.Currency);
        throw new ArgumentException();
    }
    public static CurrencyAmount operator *(CurrencyAmount currencyAmount, decimal factor) => new CurrencyAmount(currencyAmount.Amount * factor, currencyAmount.Currency);
    public static CurrencyAmount operator /(CurrencyAmount currencyAmount, decimal divisor) => new CurrencyAmount(currencyAmount.Amount / divisor, currencyAmount.Currency);
    public static explicit operator double(CurrencyAmount currencyAmount) => (double) currencyAmount.Amount;
    public static implicit operator decimal(CurrencyAmount currencyAmount) => currencyAmount.Amount;
}

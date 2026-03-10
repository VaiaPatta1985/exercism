// daily_rate calculates the daily rate given an hourly rate
double daily_rate(double hourly_rate) {
    return 8.0*hourly_rate;
}

// apply_discount calculates the price after a discount
double apply_discount(double before_discount, double discount) {
    return before_discount*(1.0-discount/100.0);
}

// monthly_rate calculates the monthly rate, given an hourly rate and a discount
// The returned monthly rate is rounded up to the nearest integer.
int monthly_rate(double hourly_rate, double discount) {
    double exact_value=apply_discount(22.0*daily_rate(hourly_rate),discount);
    int rounded=(int)exact_value;
    if(exact_value>rounded){rounded++;}
    return rounded;
}

// days_in_budget calculates the number of workdays given a budget, hourly rate,
// and discount The returned number of days is rounded down (take the floor) to
// the next integer.
int days_in_budget(int budget, double hourly_rate, double discount) {
    // TODO: Implement a function that takes a budget, an hourly rate, and a
    // discount, and calculates how many complete days of work that covers.
    return (int)budget/apply_discount(daily_rate(hourly_rate),discount);
}

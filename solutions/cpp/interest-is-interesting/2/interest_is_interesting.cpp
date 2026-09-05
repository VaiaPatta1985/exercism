#include <map>
#include <limits>

const std::map<double, double> balance_thresholds_and_interests {
    {0.0, 3.213},
    {1000.0, 0.5},
    {5000.0, 1.621},
    {std::numeric_limits<double>::infinity(), 2.475}
};

// interest_rate returns the interest rate for the provided balance.
double interest_rate(double balance) {
    for (auto balance_threshold_interest_pair: balance_thresholds_and_interests) {
        if (balance < balance_threshold_interest_pair.first) {
            return balance_threshold_interest_pair.second;
        }
    }
    return 0.0;//impossible
}

// yearly_interest calculates the yearly interest for the provided balance.
double yearly_interest(double balance) {
    return balance * interest_rate(balance) / 100;
}

// annual_balance_update calculates the annual balance update, taking into
// account the interest rate.
double annual_balance_update(double balance) {
    return balance + yearly_interest(balance);
}

// years_until_desired_balance calculates the minimum number of years required
// to reach the desired balance.
int years_until_desired_balance(double balance, double target_balance) {
    double updated_balance = balance;
    int years = 0;
    
    while (updated_balance < target_balance) {
        updated_balance = annual_balance_update(updated_balance);
        years++;
    }
    return years;
}

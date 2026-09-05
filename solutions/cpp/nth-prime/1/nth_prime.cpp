#include "nth_prime.h"

namespace nth_prime {

int nth(int ord) {
    if (ord <= 0) {
        throw (std::domain_error("Only positive integers are accepted."));
    }
    auto ith = 0;
    auto number_to_check = 1;
    while (ith < ord) {
        number_to_check++;
        bool prime = true;
        for (auto idx = 2; idx <= sqrt(number_to_check); idx++) {
            if (number_to_check % idx == 0) {
                prime = false;
                break;
            }
        }
        if (prime) {
            ith++;
        }
    }
    return number_to_check;
}

}  // namespace nth_prime

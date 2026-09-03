#include "armstrong_numbers.h"

namespace armstrong_numbers {

bool is_armstrong_number(unsigned int number) {
    auto number_of_digits = number == 0? 1: int(log10(number)) + 1;
    unsigned int sum_of_powers = 0;
    auto test = number;
    while (test != 0) {
        auto digit = test % 10;
        test /= 10;
        sum_of_powers += pow(digit, number_of_digits);
    }
    return (number == sum_of_powers);
}

}  // namespace armstrong_numbers

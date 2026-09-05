#include "collatz_conjecture.h"

namespace collatz_conjecture {

int steps(int number) {
    if (number <= 0) {
        throw (std::domain_error("Only positive integers accepted."));
    }
    auto result = 0;
    while (number != 1) {
        result++;
        if (number % 2 == 0) {
            number /= 2;
        } else {
            number *= 3;
            number++;
        }
    }
    return result;
}

}  // namespace collatz_conjecture

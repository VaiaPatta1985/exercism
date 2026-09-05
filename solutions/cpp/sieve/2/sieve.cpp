#include "sieve.h"

namespace sieve {

std::vector<int> primes(int max) {
    std::vector<int> result;
    std::vector<bool> are_prime;
    are_prime.resize(max - 1, true);
    for (auto number_to_check = 2; number_to_check <= max; number_to_check++) {
        auto index_of_number = number_to_check - 2;
        if (are_prime[index_of_number]) {
            result.push_back(number_to_check);
            for (auto idx = index_of_number + number_to_check; idx < max - 1;
                 idx += number_to_check) {
                are_prime[idx] = false;
            }
        }
    }
    return result;
}

}  // namespace sieve

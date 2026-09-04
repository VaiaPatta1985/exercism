#include "prime_factors.h"
#include <algorithm>
namespace prime_factors {

std::vector<long long> of(long long number) {
    std::vector<long long> result;
    if (number != 1) {
        long long smallest_factor = 2;
        while (smallest_factor < number) {
            if (number % smallest_factor == 0) {
                auto largest_factor = number / smallest_factor;
                auto rest_of_elements = of(largest_factor);
                auto num_factors = rest_of_elements.size();
                for (long unsigned int idx = 0; idx < num_factors; idx++) {
                    result.push_back(rest_of_elements[idx]);
                }
                break;
            } else {
                smallest_factor++;
            }
        }
        result.push_back(smallest_factor);
        std::sort(result.begin(), result.end());
    }
    return result;
}

}  // namespace prime_factors

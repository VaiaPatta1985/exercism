#include "say.h"

namespace say {

std::string in_english(long int number) {
    if (number < 0 || number > upper_bound) {
        throw (std::domain_error("Input out of bounds."));
    }
    if (number == 0) {
        return "zero";
    }
    std::string result;
    std::string partial_result;
    auto num_of_digits = (long) log10(number) + 1;
    auto num_of_chunks = (num_of_digits - 1) / 3 + 1;
    std::vector<std::string> chunks;
    long last_digit;
    for (long idx = 0; idx < num_of_chunks; idx++) {
        auto chunk = number % 1000;
        auto hundreds = chunk / 100;
        partial_result = "";
        if (hundreds > 0) {
            partial_result += uptotwenty[hundreds] + " " + third_digit;
        }
        auto two_digit = chunk % 100;
        if (two_digit > 0) {
            if (hundreds > 0) {
                partial_result += " ";
            }
            if (two_digit < 20) {
                partial_result += uptotwenty[two_digit];
            } else {
                partial_result += tens[two_digit / 10];
                last_digit = two_digit % 10;
                if (last_digit > 0) {
                    partial_result += "-" + uptotwenty[last_digit];
                }
            }
        }
        if (partial_result != "" && chunk_name[idx] != "") {
            partial_result += " " + chunk_name[idx];
        }
        if (partial_result != "") {
            chunks.emplace_back(partial_result);
        }
        number /= 1000;
    }
    int actual_num_of_chunks = chunks.size();
    for (auto idx = actual_num_of_chunks - 1; idx > 0; idx--) {
        result += chunks[idx] + " ";
    }
    result += chunks[0];
    return result;
}

}  // namespace say

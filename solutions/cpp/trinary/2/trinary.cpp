#include "trinary.h"

namespace trinary {

int to_decimal(std::string trinary_number) {
    int len = trinary_number.length();
    auto result = 0;
    auto pwr = 1;
    for (auto idx = len - 1; idx >= 0; idx--) {
        auto digit = trinary_number[idx];
        if (digit < '0' || digit > '2'){
            return 0;
        }
        auto digit_value = digit - '0';
        result += pwr * digit_value;
        pwr *= 3;
    }
    return result;
}

}  // namespace trinary

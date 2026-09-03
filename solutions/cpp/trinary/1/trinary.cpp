#include "trinary.h"

namespace trinary {

int to_decimal(string trinary_number) {
    auto len = trinary_number.length();
    auto digits = new char[len];
    copy(trinary_number.begin(), trinary_number.end(), digits);
    auto result = 0;
    auto pwr = 1;
    for (int idx = len - 1; idx >= 0; idx--) {
        auto digit = digits[idx];
        if (digit < '0' || digit > '2'){
            delete [] digits;
            return 0;
        }
        result += pwr * (digit - '0');
        pwr *= 3;
    }
    delete [] digits;
    return result;
}

}  // namespace trinary

#include "hexadecimal.h"

namespace hexadecimal {

unsigned int convert(string hex_string) {
    auto len = hex_string.length();
    auto digits = hex_string.data();
    auto result = 0;
    auto pwr = 1;
    char number;
    for (int idx = len - 1; idx >= 0; idx--) {
        auto digit = digits[idx];
        if (digit >= '0' && digit <= '9') {
            number = digit - '0';
        } else if (digit >= 'a' && digit <= 'f') {
            number = digit - 'a' + 10;
        } else if (digit >= 'A' && digit <= 'F') {
            number = digit - 'A' + 10;
        } else {
            return 0;
        }
        result += pwr * number;
        pwr *= 16;
    }
    return result;
}

}  // namespace hexadecimal

/*int to_decimal(string trinary_number) {
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
*/
#include "hexadecimal.h"

namespace hexadecimal {

unsigned int convert(string hex_string) {
    auto len = hex_string.length();
    auto result = 0;
    auto pwr = 1;
    char number;
    for (int idx = len - 1; idx >= 0; idx--) {
        auto digit = hex_string[idx];
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

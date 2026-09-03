#include "luhn.h"

namespace luhn {

bool valid(string card_number) {
    auto len = card_number.length();
    auto digits = card_number.data();
    auto must_be_doubled = false;
    auto checksum = 0;
    auto actual_len = 0;
    for (int idx = len - 1; idx >= 0; idx--) {
        auto digit = digits[idx];
        if (digit != ' ') {
            if (digit < '0' || digit > '9') {
                return false;
            }
            actual_len++;
            auto number = digit - '0';
            if (must_be_doubled && number < 9) {
                number += number;
                number %= 9;
            }
            checksum += number;
            must_be_doubled = !must_be_doubled;
        }
    }
    return (actual_len > 1 && checksum % 10 == 0);
}

}  // namespace luhn

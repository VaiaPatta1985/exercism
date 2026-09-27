#include "largest_series_product.h"

int64_t largest_series_product(char *digits, size_t span) {
    int64_t product;
    uint64_t length = 0;
    int64_t max_prod = -1;

    while (digits[length] != 0) {
        if (digits[length] < '0' || digits[length] > '9') {
            return -1;
        }
        length++;
    }
    if (span > length) {
        return -1;
    }
    int64_t sequences = length - span + 1;
    for (int64_t idx = 0; idx < sequences; idx++) {
        product = 1;
        for (int64_t digit = idx; digit < idx + (int64_t) span; digit++) {
            product *= digits[digit] - '0';
        }
        if (product > max_prod) {
            max_prod = product;
        }
    }
    return max_prod;
}

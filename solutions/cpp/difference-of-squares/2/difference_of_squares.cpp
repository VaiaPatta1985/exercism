#include "difference_of_squares.h"

namespace difference_of_squares {

int difference(int largest) {
    auto result = 0;
    for (auto i = 1; i <= largest; i++) {
        for (auto j = 1; j < i; j++) {
            result += i * j;
        }
    }
    return 2 * result;
}

int square_of_sum(int largest) {
    auto result = 0;
    for (auto i = 1; i <= largest; i++) {
        result += i;
    }
    return result * result;
}
int sum_of_squares(int largest){
    auto result = 0;
    for (auto i = 1; i <= largest; i++){
        result += i * i;
    }
    return result;
}
}  // namespace difference_of_squares

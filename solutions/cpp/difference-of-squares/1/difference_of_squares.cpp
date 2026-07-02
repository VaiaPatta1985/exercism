#include "difference_of_squares.h"

namespace difference_of_squares {

int difference(int largest){
    int result = 0;
    for(int i=1;i<=largest;i++){
        for(int j=1;j<i;j++){
            result += i*j;
        }
    }
    return 2*result;
}

int square_of_sum(int largest){
    int result = 0;
    for(int i=1;i<=largest;i++){
        result += i;
    }
    return result*result;
}
int sum_of_squares(int largest){
    int result = 0;
    for(int i=1;i<=largest;i++){
        result += i*i;
    }
    return result;
}
}  // namespace difference_of_squares

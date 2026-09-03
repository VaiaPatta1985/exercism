#include "darts.h"

namespace darts {

unsigned int score(double x, double y) {
    unsigned int result = 0;
    auto distance_from_center = sqrt(x*x+y*y);
    if (distance_from_center <= 10) {
        result++;
        if (distance_from_center <= 5) {
            result += 4;        
            if (distance_from_center <= 1) {
                result += 5;        
            }
        }        
    }
    return result;
}

}  // namespace darts

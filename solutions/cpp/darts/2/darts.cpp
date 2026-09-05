#include "darts.h"

namespace darts {

unsigned int score(double x, double y) {
    auto distance_from_center = sqrt(x*x+y*y);
    for (auto distance_score_pair: distance_to_points) {
        if (distance_from_center <= distance_score_pair.first) {
            return distance_score_pair.second;
        }
    }
    return 0;
}

}  // namespace darts

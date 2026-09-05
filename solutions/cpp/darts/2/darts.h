#pragma once
#include <cmath>
#include <map>
namespace darts {
const std::map<int, int> distance_to_points {
    {1, 10},
    {5, 5},
    {10, 1},
};
unsigned int score(double x, double y);

}  // namespace darts

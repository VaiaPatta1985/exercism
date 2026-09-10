#include "binary_search.h"

namespace binary_search {

int find(const std::vector<int>& arr, int val) {
    if (arr.empty()) {
        throw (std::domain_error("Not found (array empty)."));
    }
    int start{};
    int end = arr.size();
    while (true) {
        if (val < arr[start] || val > arr[end - 1]) {
            throw (std::domain_error("Not found."));
        }
        auto midpoint = (end + start) / 2;
        auto middle_value = arr[midpoint];
        if (middle_value == val) {
            return midpoint;
        }
        if (middle_value < val) {
            start = midpoint + 1;
        } else {
            end = midpoint;
        }
    }
}

}  // namespace binary_search

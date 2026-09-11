#include "etl.h"

namespace etl {

std::map<char, int> transform(const std::map<int, std::vector<char>>& old) {
    std::map<char, int> result;
    for (const auto& points_letters_pair : old) {
        for (const auto& letter : points_letters_pair.second) {
            result[letter - 'A' + 'a'] =
                points_letters_pair.first;
        }
    }
    return result;
}

}  // namespace etl

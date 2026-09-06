#include "etl.h"

namespace etl {

std::map<char, int> transform(std::map<int, std::vector<char>> old) {
    std::map<char, int> result;
    for (auto points_letters_pair : old) {
        int len = points_letters_pair.second.size();
        for (auto idx = 0; idx < len; idx++) {
            result[points_letters_pair.second[idx] - 'A' + 'a'] =
                points_letters_pair.first;
        }
    }
    return result;
}

}  // namespace etl

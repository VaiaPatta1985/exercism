#include "reverse_string.h"

namespace reverse_string {

std::string reverse_string(const std::string& string_to_reverse) {
    const int len = string_to_reverse.length();
    std::string result;
    for (auto idx = len - 1; idx >= 0; idx--) {
        result.append(1, string_to_reverse[idx]);
    }
    return result;
}

}  // namespace reverse_string

#include "reverse_string.h"

namespace reverse_string {

std::string reverse_string(std::string string_to_reverse) {
    auto len = string_to_reverse.length();
    auto char_array = string_to_reverse.data();
    std::string result = "";
    for (auto idx = len - 1; idx < len; idx--) {
        result.append(1, char_array[idx]);
    }
    return result;
}

}  // namespace reverse_string

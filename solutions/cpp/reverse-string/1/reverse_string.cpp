#include "reverse_string.h"

namespace reverse_string {

string reverse_string(string string_to_reverse) {
    auto len = string_to_reverse.length();
    auto char_array = string_to_reverse.data();
    string result = "";
    for (int idx = len - 1; idx >= 0; idx--) {
        result.append(1, char_array[idx]);
    }
    return result;
}

}  // namespace reverse_string

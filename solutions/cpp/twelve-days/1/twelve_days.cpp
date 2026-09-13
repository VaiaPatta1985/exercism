#include "twelve_days.h"

namespace twelve_days {

std::string recite(int first, int last) {
    std::string result = verse(first);
    for (auto idx = first + 1; idx <= last; idx++) {
        result = result + verse_link + verse(idx);
    }
    return result;
}
std::string verse(int position) {
    std::string result = intro(position);
    for (auto idx = position; idx >= 1; idx--) {
        result = result +
                 presents[idx] +
                 (idx < num_of_endings ? phrase_end[idx] :
                                         phrase_end[num_of_endings - 1]);
    }
    return result;
}
}  // namespace twelve_days

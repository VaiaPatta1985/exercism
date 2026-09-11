#include "matching_brackets.h"

namespace matching_brackets {
bool check(const std::string& text) {
    std::vector<char> tally;
    for (const auto& current_char : text) {
        switch (current_char) {
            case '[':
            case '{':
            case '(':
                tally.push_back(current_char);
                break;
            case ']':
            case '}':
            case ')':
                if (tally.empty()) {
                    return false;
                }
                if (open_close.at(tally.back()) != current_char) {
                    return false;
                }
                tally.pop_back();
        };
    }
    return tally.empty();
}

}  // namespace matching_brackets

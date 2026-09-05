#include "rotational_cipher.h"

namespace rotational_cipher {

char rotate(char letter, int rot, bool is_uppercase) {
    auto alphabet_start = is_uppercase ? 'A' : 'a';
    auto letter_value = letter - alphabet_start;
    return alphabet_start + (letter_value + (char) rot) % 26;
}
std::string rotate(std::string input, int rot) {
    const int len = input.length();
    std::string result;

    for(auto position = 0; position < len; position++) {
        auto letter = input[position];
        if (letter >= 'A' && letter <= 'Z') {
            letter = rotate(letter, rot, true);
        }
        if (letter >= 'a' && letter <= 'z') {
            letter = rotate(letter, rot, false);
        }
        result += letter;
    }
    return result;
}

}  // namespace rotational_cipher

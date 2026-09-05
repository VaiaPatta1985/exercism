#include "atbash_cipher.h"

namespace atbash_cipher {

std::string encode(std::string input) {
    auto result = decode(input);
    int len = result.length();
    
    for (auto position = 5; position < len; position += 6){
        result.insert(position, 1, ' ');
        len++;
    }
    return result;
}

bool is_lowercase(char letter) {
    return letter >= 'a' && letter <= 'z';
}

bool is_uppercase(char letter) {
    return letter >= 'A' && letter <= 'Z';
}

bool is_digit(char letter) {
    return letter >= '0' && letter <= '9';
}

char make_lowercase(char letter) {
    if (is_uppercase(letter)) {
        letter += 'a' - 'A';
    }
    return letter;
}

char reverse_lowercase(char letter) {
    if (is_lowercase(letter)) {
        letter = 'a' + 'z' - letter;
    }
    return letter;
}

std::string decode(std::string input) {
    const int len = input.length();
    std::string result;

    for (auto idx = 0; idx < len; idx++) {
        auto letter = reverse_lowercase(make_lowercase(input[idx]));
        if (is_digit(letter) || is_lowercase(letter)) {
            result.push_back(letter);
        }
    }
    return result;
}

}  // namespace atbash_cipher

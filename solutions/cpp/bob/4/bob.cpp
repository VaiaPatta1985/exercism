#include "bob.h"

namespace bob {

bool is_whitespace(char letter) {
    const int num_of_whitespace_characters = whitespace_characters.size();
    int idx;
    for (idx = 0; idx < num_of_whitespace_characters; idx++) {
        if (letter == whitespace_characters[idx]) {
            break;
        }
    }
    return idx < num_of_whitespace_characters;
}

bool is_lowercase(char letter) {
    return letter >= 'a' && letter <= 'z';
}

bool is_uppercase(char letter) {
    return letter >= 'A' && letter <= 'Z';
}

std::string hey(const std::string& greeting) {
    auto greeting_without_whitespace = remove_whitespace(greeting);
    const auto len = greeting_without_whitespace.length();
    
    if (len == 0) {
        return "Fine. Be that way!";
    }
    
    auto yelled = is_all_capitals(greeting_without_whitespace);
    
    if (greeting_without_whitespace[len - 1] == '?') {
        if (yelled) {
            return "Calm down, I know what I'm doing!";
        }
        return "Sure.";
    }
    if (yelled) {
        return "Whoa, chill out!";
    }
    return "Whatever.";
}

std::string remove_whitespace(const std::string& sentence) {
    const int len = sentence.length();
    int idx;
    for (idx = 0; idx < len; idx++) {
        if (!is_whitespace(sentence[idx])) {
            break;
        }
    }
    const auto start_pos = idx;
    for (idx = len - 1; idx >= 0; idx--) {
        if (!is_whitespace(sentence[idx])) {
            break;
        }
    }
    const auto end_pos = idx + 1;
    return sentence.substr(start_pos, end_pos - start_pos);
}

bool is_all_capitals(const std::string& sentence){
    auto contains_capitals = false;
    auto contains_low = false;
    for(const auto& letter : sentence){
        contains_capitals = contains_capitals || is_uppercase(letter);
        contains_low = contains_low || is_lowercase(letter);
    }
    return contains_capitals && !contains_low;
}

}  // namespace bob

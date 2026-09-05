#pragma once
#include <string>
#include <vector>

namespace bob {
const std::vector<char> whitespace_characters = {' ', '\n', '\r', '\t', '\v'};
bool is_whitespace(char letter);
bool is_lowercase(char letter);
bool is_uppercase(char letter);
std::string hey(std::string greeting);
std::string remove_whitespace(std::string sentence);
bool is_all_capitals(std::string sentence);

}  // namespace bob

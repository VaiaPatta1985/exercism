#pragma once
#include <string>
#include <vector>

namespace bob {
const std::vector<char> whitespace_characters = {' ', '\n', '\r', '\t', '\v'};
bool is_whitespace(char letter);
bool is_lowercase(char letter);
bool is_uppercase(char letter);
std::string hey(const std::string& greeting);
std::string remove_whitespace(const std::string& sentence);
bool is_all_capitals(const std::string& sentence);

}  // namespace bob

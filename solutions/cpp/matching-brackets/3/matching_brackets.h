#pragma once
#include <string>
#include <vector>
#include <map>
namespace matching_brackets {
const std::map<char, char> open_close {
    {'[', ']'},
    {'{', '}'},
    {'(', ')'},
};
bool check(std::string text);

}  // namespace matching_brackets

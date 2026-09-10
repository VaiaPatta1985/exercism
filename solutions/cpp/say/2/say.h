#pragma once
#include <string>
#include <vector>
#include <stdexcept>
#include <cmath>
namespace say {
const auto upper_bound = 999999999999;
const std::string third_digit = "hundred";
const std::vector<std::string> chunk_name = {
    "",
    "thousand",
    "million",
    "billion"
};
const std::vector<std::string> tens = {
    "",
    "",
    "twenty",
    "thirty",
    "forty",
    "fifty",
    "sixty",
    "seventy",
    "eighty",
    "ninety",
};
const std::vector<std::string> uptotwenty = {
    "zero",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten",
    "eleven",
    "twelve",
    "thirteen",
    "fourteen",
    "fifteen",
    "sixteen",
    "seventeen",
    "eighteen",
    "nineteen",
};
std::string in_english(long int number);

}  // namespace say

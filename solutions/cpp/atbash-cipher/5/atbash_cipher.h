#pragma once
#include <string>
namespace atbash_cipher {
bool is_lowercase(char letter);
bool is_uppercase(char letter);
bool is_digit(char letter);
char make_lowercase(char letter);
char reverse_lowercase(char letter);
std::string encode(const std::string& input);
std::string decode(const std::string& input);
}  // namespace atbash_cipher

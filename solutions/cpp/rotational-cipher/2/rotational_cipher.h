#pragma once

#include <string>

namespace rotational_cipher {
char rotate(char letter, int rot, bool is_uppercase);
std::string rotate(std::string input, int rot);

}  // namespace rotational_cipher

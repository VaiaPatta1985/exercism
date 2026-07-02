#pragma once
#include <string>
namespace atbash_cipher {
#define UPPERCASE_TO_LOWERCASE(x)        ('a' - 'A' + x)
#define REVERSED_ALPHABET(x)             ('a' + 'z' - x)
using namespace std;
string encode(string input);
string decode(string input);
}  // namespace atbash_cipher

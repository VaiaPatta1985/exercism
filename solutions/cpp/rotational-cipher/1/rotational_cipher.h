#pragma once

#include <string>

namespace rotational_cipher {
#define ROTATE(x, y)        (((x)+(y))%26)
using namespace std;
string rotate(string input, int rot);

}  // namespace rotational_cipher

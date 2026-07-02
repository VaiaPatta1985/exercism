#include "rotational_cipher.h"

namespace rotational_cipher {

string rotate(string input, int rot){
    const int len = input.length();
    string result = "";
    char letter;

    for(int position = 0; position < len; position++) {
        letter = input[position];
        if (letter >= 'A' && letter <= 'Z') {
            letter = ROTATE((letter - 'A'), (char) rot) + 'A';
        }
        if (letter >= 'a' && letter <= 'z') {
            letter = ROTATE((letter - 'a'), (char) rot) + 'a';
        }
        result.push_back(letter);
    }
    return result;
}

}  // namespace rotational_cipher

#include "atbash_cipher.h"

namespace atbash_cipher {

string encode(string input) {
    string result = decode(input);
    int len = result.length();
    
    for (int position = 5; position < len; position += 6){
        result.insert(position, 1, ' ');
        len++;
    }
    return result;
}

string decode(string input) {
    const int len = input.length();
    string result = "";
    char letter;

    for(int idx=0;idx<len;idx++) {
        letter = input[idx];
        if (letter >= '0' && letter <= '9') {
            result.push_back(letter);
        }
        if (letter >= 'A' && letter <= 'Z') {
            letter = UPPERCASE_TO_LOWERCASE(letter);
        }
        if (letter >= 'a' && letter <= 'z') {
            result.push_back(REVERSED_ALPHABET(letter));
        }
    }
    return result;
}

}  // namespace atbash_cipher

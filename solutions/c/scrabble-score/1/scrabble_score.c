#include "scrabble_score.h"
unsigned int score(const char *word){
    const unsigned int letter_scores[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};
    int index = 0, letter_index;
    unsigned int word_score = 0;
    char letter = word[0];
    while (letter > 0){
        letter_index = (int) (letter - 'A' < 26 ? letter - 'A' : letter - 'a');
        word_score += letter_scores[letter_index];
        letter = word[++index];
    }
    return word_score;
}

#include <string.h>
#include "bob.h"

#define IS_WHITESPACE(x)        (x==' '||x=='\n'||x=='\r'||x=='\t')
#define IS_UPPERCASE(x)         (x>=65&&x<=90)
#define IS_LOWERCASE(x)         (x>=97&&x<=122)

void remove_whitespace(char *sentence, char stripped[1000]);
int is_all_capitals(char sentence[1000], int len);

char *hey_bob(char *greeting){
    char greeting_without_whitespace[1000], *sure="Sure.", *chillout="Whoa, chill out!", *calmdown="Calm down, I know what I'm doing!", *fine="Fine. Be that way!", *whatever="Whatever.";
    int char_idx, stripped_greeting_length, yelled;

    remove_whitespace(greeting, greeting_without_whitespace);
    if(greeting_without_whitespace[0]=='\0'){
        return fine;
    }
    for(char_idx=1;char_idx<1000;char_idx++){
        if(greeting_without_whitespace[char_idx]=='\0'){
            break;
        }
    }
    stripped_greeting_length=char_idx;
    yelled=is_all_capitals(greeting_without_whitespace, stripped_greeting_length);
    if(greeting_without_whitespace[char_idx-1]=='?'){
        if(yelled){
            return calmdown;
        }
        return sure;
    }
    if(yelled){
        return chillout;
    }
    return whatever;
}

void remove_whitespace(char *sentence, char stripped[1000]){
    int str_idx=0;
    for(int c_i=0;c_i<1000;c_i++){
        if(!IS_WHITESPACE(sentence[c_i])){
            stripped[str_idx++]=sentence[c_i];
            if(sentence[c_i]=='\0'){
                break;
            }
        }
    }
}

int is_all_capitals(char sentence[1000], int len){
    int num_capitals=0, num_low=0;
    for(int ci=0;ci<len;ci++){
        num_capitals+=IS_UPPERCASE(sentence[ci]);
        num_low+=IS_LOWERCASE(sentence[ci]);
    }
    return num_capitals&&!num_low;
}

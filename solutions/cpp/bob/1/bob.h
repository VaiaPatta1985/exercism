#pragma once
#include <string>
using namespace std;
namespace bob {

const std::string hey(const char *greeting);
void remove_whitespace(const char *sentence, char stripped[1000]);
int is_all_capitals(char sentence[1000], int len);

}  // namespace bob

#pragma once
#include <string>
#include <vector>
#include <unordered_set>
namespace allergies {
using namespace std;
const vector<string> allergy_list = {"eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"};
class allergy_test {
    unsigned int allergy_code;
    public:
    allergy_test(unsigned int code);
    bool is_allergic_to(string thing);
    unordered_set<string> get_allergies();
};
}  // namespace allergies

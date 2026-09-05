#pragma once
#include <string>
#include <vector>
#include <unordered_set>
#include <cmath>
namespace allergies {

const std::vector<std::string> allergy_list = {
    "eggs",
    "peanuts",
    "shellfish",
    "strawberries",
    "tomatoes",
    "chocolate",
    "pollen",
    "cats"
};
class allergy_test {
    public:
    allergy_test(unsigned int code);
    bool is_allergic_to(std::string thing);
    std::unordered_set<std::string> get_allergies();
    private:
    unsigned int allergy_code;
};
}  // namespace allergies

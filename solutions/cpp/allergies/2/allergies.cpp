#include "allergies.h"

namespace allergies {
allergy_test::allergy_test(unsigned int code) {
    unsigned int mask = (((unsigned int) 1) << allergy_list.size()) - 1;
    this->allergy_code = code & mask;
}
    
bool allergy_test::is_allergic_to(std::string thing) {
    auto len = allergy_list.size();
    unsigned int idx;
    for (idx = 0; idx < len; idx++) {
        if (thing == allergy_list[idx]) {
            break;
        }
    }
    return (((this->allergy_code >> idx) & (unsigned int) 1) == (unsigned int) 1);
}
    
std::unordered_set<std::string> allergy_test::get_allergies() {
    std::unordered_set<std::string> result;
    auto test = this->allergy_code;
    auto current_allergy = 0;
    while (test != 0) {
        if ((test & (unsigned int) 1) == (unsigned int) 1) {
            //result.insert(allergy_list[current_allergy]);
            result.emplace(allergy_list[current_allergy]);
        }
        current_allergy++;
        test >>= 1;
    }
    return result;
}
}  // namespace allergies

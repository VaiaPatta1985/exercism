#include "allergies.h"

namespace allergies {
allergy_test::allergy_test(unsigned int code) {
    unsigned int mask = (((unsigned int) 1) << allergy_list.size()) - 1;
    allergy_code = code & mask;
}
    
bool allergy_test::is_allergic_to(const std::string& thing) {
    const auto len = allergy_list.size();
    unsigned int idx;
    for (idx = 0; idx < len; idx++) {
        if (thing == allergy_list[idx]) {
            break;
        }
    }
    return (((allergy_code >> idx) & (unsigned int) 1) == (unsigned int) 1);
}
    
std::unordered_set<std::string> allergy_test::get_allergies() {
    std::unordered_set<std::string> result;
    auto test = allergy_code;
    unsigned int current_allergy{};
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

#include "kindergarten_garden.h"

namespace kindergarten_garden {
std::array<Plants, 4> plants(std::string initials, std::string name) {
    auto class_size = initials.length() / 2 + 1;
    const int max_class_size = names_alphabetically.size();
    std::array<Plants, 4> result;
    
    //int offset = name[0] - 'A';
    int offset;
    
    for (offset = 0; offset < max_class_size; offset++) {
        if (names_alphabetically[offset] == name) {
            break;
        }
    }
    
    if (offset == max_class_size) {
        throw (std::domain_error(""));
    }
    
    result[0] = initial_to_plant.at(initials[2*offset]);
    result[1] = initial_to_plant.at(initials[2*offset + 1]);
    result[2] = initial_to_plant.at(initials[class_size + 2*offset]);
    result[3] = initial_to_plant.at(initials[class_size + 2*offset + 1]);
    
    return result;
}
}  // namespace kindergarten_garden

#include "kindergarten_garden.h"

namespace kindergarten_garden {
Plants initial_to_plant(char initial) {
    switch (initial) {
        case 'R': return Plants::radishes;
        case 'G': return Plants::grass;
        case 'C': return Plants::clover;
        case 'V': return Plants::violets;
    };
    throw (std::domain_error(""));
}
std::array<Plants, 4> plants(std::string rows, std::string name) {
    int offset = name.data()[0] - 'A';
    auto class_size = rows.length() / 2 + 1;
    auto initials = rows.data();
    std::array<Plants, 4> result;
    result[0] = initial_to_plant(initials[2*offset]);
    result[1] = initial_to_plant(initials[2*offset + 1]);
    result[2] = initial_to_plant(initials[class_size + 2*offset]);
    result[3] = initial_to_plant(initials[class_size + 2*offset + 1]);
    return result;
}

}  // namespace kindergarten_garden

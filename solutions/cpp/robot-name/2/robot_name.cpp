#include "robot_name.h"

namespace robot_name {

std::vector<std::string> robot::unused_names = robot::name_generator();

robot::robot() {
    reset();
}

void robot::reset() {
    int num_of_unused_names = unused_names.size();
    auto num = std::rand() % num_of_unused_names;
    m_name = unused_names[num];
    unused_names[num] = unused_names[num_of_unused_names - 1];
    unused_names.pop_back();
}

std::string robot::name() const {
    return m_name;
}

std::vector<std::string> robot::name_generator() {
    std::vector<std::string> result;
    std::srand(std::time({}));
    for (auto first_char = 'A'; first_char <= 'Z'; first_char++) {
        for (auto second_char = 'A'; second_char <= 'Z'; second_char++) {
            for (auto third_char = '0'; third_char <= '9'; third_char++) {
                for (auto fourth_char = '0'; fourth_char <= '9'; fourth_char++) {
                    for (auto fifth_char = '0'; fifth_char <= '9'; fifth_char++) {
                        result.push_back(
                            {first_char,
                             second_char,
                             third_char,
                             fourth_char,
                             fifth_char}
                        );
                    }
                }
            }
        }
    }
    return result;
}

}  // namespace robot_name

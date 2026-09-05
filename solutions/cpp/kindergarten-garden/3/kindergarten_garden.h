#pragma once
#include <string>
#include <array>
#include <vector>
#include <stdexcept>
#include <map>

namespace kindergarten_garden {
enum class Plants {
    clover,
    grass,
    violets,
    radishes
};
    
const std::vector<std::string> names_alphabetically = {
    "Alice", "Bob", "Charlie", "David", "Eve", "Fred",
    "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"
};
    
const std::map<char, Plants> initial_to_plant {
    {'C', Plants::clover},
    {'G', Plants::grass},
    {'V', Plants::violets},
    {'R', Plants::radishes},
};
    
std::array<Plants, 4> plants(std::string rows, std::string name);
}  // namespace kindergarten_garden

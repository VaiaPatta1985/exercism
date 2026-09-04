#pragma once
#include <string>
#include <array>
#include <vector>
#include <stdexcept>
namespace kindergarten_garden {
const std::vector<std::string> names_alphabetically = {"Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"};
enum class Plants {
    clover,
    grass,
    violets,
    radishes
};

Plants initial_to_plant(char initial);
std::array<Plants, 4> plants(std::string rows, std::string name);

}  // namespace kindergarten_garden

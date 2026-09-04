#pragma once
#include <string>
#include <array>
#include <stdexcept>
namespace kindergarten_garden {

enum class Plants {
    clover,
    grass,
    violets,
    radishes
};

Plants initial_to_plant(char initial);
std::array<Plants, 4> plants(std::string rows, std::string name);

}  // namespace kindergarten_garden

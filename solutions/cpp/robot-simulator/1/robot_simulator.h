#pragma once
#include <utility>
#include <string>
namespace robot_simulator {

enum class Bearing {
    NORTH = 0,
    EAST = 1,
    SOUTH = 2,
    WEST = 3
};

class Robot {
public:
    Robot(std::pair<int, int> position={0, 0}, Bearing bearing=Bearing::NORTH);
    Bearing get_bearing() const;
    std::pair<int, int> get_position() const;
    void turn_right();
    void turn_left();
    void advance();
    void execute_sequence(std::string commands);
private:
    std::pair<int, int> m_position;
    Bearing m_bearing;
};

}  // namespace robot_simulator

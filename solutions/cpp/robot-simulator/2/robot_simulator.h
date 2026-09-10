#pragma once
#include <utility>
#include <string>
#include <map>
namespace robot_simulator {

enum class Bearing {
    NORTH,
    EAST,
    SOUTH,
    WEST
};

class Robot {
public:
    static const std::map<Bearing, Bearing> right_turns;
    static const std::map<Bearing, Bearing> left_turns;
    
    Robot(std::pair<int, int> position={0, 0}, Bearing bearing=Bearing::NORTH);
    Bearing get_bearing() const;
    std::pair<int, int> get_position() const;
    void turn_right();
    void turn_left();
    void advance();
    void execute_sequence(const std::string& commands);
private:
    std::pair<int, int> m_position;
    Bearing m_bearing;
};

}  // namespace robot_simulator

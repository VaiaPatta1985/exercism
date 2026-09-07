#include "robot_simulator.h"

namespace robot_simulator {

Robot::Robot(std::pair<int, int> position, Bearing bearing) :
    m_position{position}, m_bearing{bearing} {}

Bearing Robot::get_bearing() const {
    return m_bearing;
}

std::pair<int, int> Robot::get_position() const {
    return m_position;
}

void Robot::turn_right() {
    m_bearing = (Bearing) (((int) m_bearing + 1) % 4);
}

void Robot::turn_left() {
    m_bearing = (Bearing) (((int) m_bearing + 3) % 4);
}

void Robot::advance() {
    switch (m_bearing) {
        case Bearing::NORTH:
            m_position.second++;
            break;
        case Bearing::SOUTH:
            m_position.second--;
            break;
        case Bearing::EAST:
            m_position.first++;
            break;
        case Bearing::WEST:
            m_position.first--;
    };
}

void Robot::execute_sequence(std::string commands) {
    int len = commands.length();
    for (auto idx = 0; idx < len; idx++) {
        switch (commands[idx]) {
            case 'R':
                turn_right();
                break;
            case 'L':
                turn_left();
                break;
            case 'A':
                advance();
        };
    }
}
}  // namespace robot_simulator

#pragma once
#include <string>
#include <vector>
#include <cstdlib>
#include <ctime>
namespace robot_name {
std::vector<std::string> name_generator();
class robot {
public:
    robot();
    std::string name() const;
    void reset();
private:
    std::string m_name;
};

}  // namespace robot_name

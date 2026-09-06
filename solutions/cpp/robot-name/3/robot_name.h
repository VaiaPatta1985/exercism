#pragma once
#include <string>
#include <vector>
#include <cstdlib>
#include <ctime>
namespace robot_name {

class robot {
public:
    robot();
    std::string name() const;
    void reset();
private:
    std::string m_name;
    static std::vector<std::string> name_generator();
    static std::vector<std::string> unused_names;
};

}  // namespace robot_name

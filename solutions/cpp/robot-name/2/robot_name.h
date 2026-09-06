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
    static std::vector<std::string> name_generator();
    static std::vector<std::string> unused_names;
private:
    std::string m_name;
};

}  // namespace robot_name

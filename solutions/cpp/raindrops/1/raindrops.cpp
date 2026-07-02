#include "raindrops.h"

namespace raindrops {

std::string convert(int num) {
    std::string result = "";
    if (!(num % 3)) {
        result += "Pling";
    }
    
    if (!(num % 5)) {
        result += "Plang";
    }
    
    if (!(num % 7)) {
        result += "Plong";
    }

    if (!(result.compare(""))) {
        result = std::to_string(num);
    }
    return result;
}

}  // namespace raindrops

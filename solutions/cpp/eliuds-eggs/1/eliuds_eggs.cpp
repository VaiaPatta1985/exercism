#include "eliuds_eggs.h"

namespace chicken_coop {

unsigned int positions_to_quantity(unsigned int code_num) {
    unsigned int num_ones = 0;
    while (code_num != 0) {
        num_ones += code_num & (unsigned int) 1;
        code_num >>= 1;
    }
    return num_ones;
}

}  // namespace chicken_coop

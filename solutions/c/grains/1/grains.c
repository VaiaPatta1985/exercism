#include "grains.h"

uint64_t square(uint8_t index){
    if(index<2)return (uint64_t)index;
    return (1ull<<(index-2))<<1;
}
uint64_t total(void){
    return ~0ull;
}

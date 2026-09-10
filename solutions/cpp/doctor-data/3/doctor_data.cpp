#include "doctor_data.h"

heaven::Vessel::Vessel(const std::string& owner, int gen) {
    generation = gen;
    current_owner = owner;
}
heaven::Vessel::Vessel(const std::string& owner, int gen, star_map::System origin) {
    generation = gen;
    current_system = origin;
    current_owner = owner;
}
heaven::Vessel heaven::Vessel::replicate(const std::string& owner) {
    return heaven::Vessel(owner, generation + 1);
}
void heaven::Vessel::make_buster() {
    busters++;
}
bool heaven::Vessel::shoot_buster() {
    bool is_loaded = busters > 0;
    if (is_loaded) {
        busters--;
    }
    return is_loaded;
}
std::string heaven::get_older_bob(const heaven::Vessel& v1, const heaven::Vessel& v2){
    return v1.generation < v2.generation ? v1.current_owner : v2.current_owner;
}
bool heaven::in_the_same_system(const heaven::Vessel& v1, const heaven::Vessel& v2){
    return v1.current_system == v2.current_system;
}

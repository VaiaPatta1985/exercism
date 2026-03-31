#include "doctor_data.h"

heaven::Vessel::Vessel(std::string owner, int gen){
    this->generation=gen;
    this->current_owner=owner;
}
heaven::Vessel::Vessel(std::string owner, int gen, star_map::System origin){
    this->generation=gen;
    this->current_system=origin;
    this->current_owner=owner;
}
heaven::Vessel heaven::Vessel::replicate(std::string owner){
    return heaven::Vessel(owner, this->generation+1);
}
void heaven::Vessel::make_buster(){
    this->busters++;
}
bool heaven::Vessel::shoot_buster(){
    bool is_loaded=this->busters>0;
    if(is_loaded)this->busters--;
    return is_loaded;
}
std::string heaven::get_older_bob(heaven::Vessel v1, heaven::Vessel v2){
    return v1.generation<v2.generation?v1.current_owner:v2.current_owner;
}
bool heaven::in_the_same_system(heaven::Vessel v1, heaven::Vessel v2){
    return v1.current_system==v2.current_system;
}

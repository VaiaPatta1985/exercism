#include "speedywagon.h"

namespace speedywagon {

// Enter your code below:

// Please don't change the interface of the uv_light_heuristic function
int uv_light_heuristic(std::vector<int>* data_array) {
    double avg{};
    for (auto element : *data_array) {
        avg += element;
    }
    avg /= data_array->size();
    int uv_index{};
    for (auto element : *data_array) {
        if (element > avg) ++uv_index;
    }
    return uv_index;
}
bool connection_check(pillar_men_sensor *sensor){
    return sensor!=nullptr;
}
int activity_counter(pillar_men_sensor *sensors, int capacity){
    int readings=0;
    for(int idx=0;idx<capacity;idx++){
        readings+=sensors[idx].activity;
    }
    return readings;
}
bool alarm_control(pillar_men_sensor *sensor){
    if(connection_check(sensor)){
        if(sensor->activity>0)return true;
    }
    return false;
}
bool uv_alarm(pillar_men_sensor *sensor){
    if(connection_check(sensor)){
        if(uv_light_heuristic(&(sensor->data))>sensor->activity)return true;
    }
    return false;
}
}  // namespace speedywagon

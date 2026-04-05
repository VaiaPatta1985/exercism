#pragma once

#include <string>
#include <memory>

namespace troy {

struct artifact {
    // constructors needed (until C++20)
    artifact(std::string name) : name(name) {}
    std::string name;
};

struct power {
    // constructors needed (until C++20)
    power(std::string effect) : effect(effect) {}
    std::string effect;
};

struct human{
    human() : possession(nullptr), own_power(nullptr), influenced_by(nullptr) {}
    std::unique_ptr<artifact> possession;
    std::shared_ptr<power> own_power;
    std::shared_ptr<power> influenced_by;
};
void give_new_artifact(human &owner, std::string artifact_name);
void exchange_artifacts(std::unique_ptr<artifact> &artifact1, std::unique_ptr<artifact> &artifact2);
void manifest_power(human &wielder, std::string power_description);
void use_power(const human &caster, human &target);
int power_intensity(const human &wizard);
}  // namespace troy

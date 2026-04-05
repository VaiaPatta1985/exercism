#include "power_of_troy.h"

namespace troy {
    void give_new_artifact(human &owner, std::string artifact_name){
        owner.possession=std::make_unique<artifact>(artifact_name);
    }
    void exchange_artifacts(std::unique_ptr<artifact> &artifact1, std::unique_ptr<artifact> &artifact2){
        //artifact temp=*artifact1;
        //*artifact1=*artifact2;
        //*artifact2=temp;
        std::swap(artifact1, artifact2);
    }
    void manifest_power(human &wielder, std::string power_description){
        wielder.own_power=std::make_shared<power>(power_description);
    }
    void use_power(const human &caster, human &target){
        target.influenced_by=caster.own_power;
    }
    int power_intensity(const human &wizard){
        if(wizard.own_power==nullptr){
            return 0;
        }
        return wizard.own_power.use_count();
    }
}  // namespace troy

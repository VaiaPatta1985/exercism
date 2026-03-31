#ifndef INCLUDE_GUARD
#define INCLUDE_GUARD
#include <string>

namespace star_map{
    enum class System{
        BetaHydri,
        Sol,
        EpsilonEridani,
        AlphaCentauri,
        DeltaEridani,
        Omicron2Eridani,
    };
}
namespace heaven{
    using namespace star_map;
    class Vessel{
        public:
            star_map::System current_system=star_map::System::Sol;
            int generation;
            int busters=0;
            std::string current_owner;
            
            Vessel(std::string owner, int gen);
            Vessel(std::string owner, int gen, star_map::System origin);
            Vessel replicate(std::string owner);
            void make_buster();
            bool shoot_buster();
        private:
    };

    std::string get_older_bob(Vessel v1, Vessel v2);
    bool in_the_same_system(Vessel v1, Vessel v2);
}

#endif
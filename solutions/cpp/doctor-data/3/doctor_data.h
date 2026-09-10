#ifndef INCLUDE_GUARD
#define INCLUDE_GUARD
#include <string>

namespace star_map {
    enum class System {
        BetaHydri,
        Sol,
        EpsilonEridani,
        AlphaCentauri,
        DeltaEridani,
        Omicron2Eridani,
    };
}
namespace heaven {
    using namespace star_map;
    class Vessel {
        public:
            star_map::System current_system = star_map::System::Sol;
            int generation;
            int busters{};
            std::string current_owner;
            
            Vessel(const std::string& owner, int gen);
            Vessel(const std::string& owner, int gen, star_map::System origin);
            Vessel replicate(const std::string& owner);
            void make_buster();
            bool shoot_buster();
        private:
    };

    std::string get_older_bob(const Vessel& v1, const Vessel& v2);
    bool in_the_same_system(const Vessel& v1, const Vessel& v2);
}

#endif
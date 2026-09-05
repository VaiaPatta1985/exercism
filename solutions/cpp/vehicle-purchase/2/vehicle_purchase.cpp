#include "vehicle_purchase.h"

#include <limits>
#include <vector>
#include <functional>
#include <map>

namespace vehicle_purchase {
const std::vector<std::string> vehicles_requiring_license = {"car", "truck"};
const auto vehicle_choice_announcement = [](std::string vehicle_name) {
    return vehicle_name + " is clearly the better choice.";
};
const std::map<double, double> max_age_to_price_proportion {
    {3.0, 0.8},
    {10.0, 0.7},
    {std::numeric_limits<double>::infinity(), 0.5}
};

// needs_license determines whether a license is needed to drive a type of
// vehicle. Only "car" and "truck" require a license.
bool needs_license(std::string kind) {
    auto result = false;
    auto number_of_vehicles_requiring_license = vehicles_requiring_license.size();
    for (long unsigned idx = 0; idx < number_of_vehicles_requiring_license; idx++) {
        result = result || kind == vehicles_requiring_license[idx];
    }
    return result;
}

// choose_vehicle recommends a vehicle for selection. It always recommends the
// vehicle that comes first in lexicographical order.
std::string choose_vehicle(std::string option1, std::string option2) {
    return vehicle_choice_announcement(option1 < option2 ? option1 : option2);
}

// calculate_resell_price calculates how much a vehicle can resell for at a
// certain age.
double calculate_resell_price(double original_price, double age) {
    for (auto age_price_pair : max_age_to_price_proportion) {
        if (age < age_price_pair.first) {
            return original_price * age_price_pair.second;
        }
    }
    return 0.0;//impossible
}

}  // namespace vehicle_purchase

#include "lasagna_master.h"

namespace lasagna_master {

int preparationTime(const std::vector<std::string>& layers, int prep_time_per_layer) {
    return layers.size() * prep_time_per_layer;
}
amount quantities(const std::vector<std::string>& layers) {
    int noodles{};
    int sauce{};
    amount result;

    for (const auto& layer : layers) {
        if (layer == "noodles") {
            noodles++;
        }
        if (layer == "sauce") {
            sauce++;
        }
    }
    /*
    result = {
        .noodles = noodles * grams_of_noodles_per_layer,
        .sauce = sauce * liters_of_sauce_per_layer,
    };
    */
    result.noodles = noodles * grams_of_noodles_per_layer;
    result.sauce = sauce * liters_of_sauce_per_layer;
    return result;
}
void addSecretIngredient(std::vector<std::string> &my_ingredients, const std::vector<std::string> &their_ingredients){
    auto my_last_ingredient = my_ingredients.size() - 1;
    auto their_last_ingredient = their_ingredients.size() - 1;

    my_ingredients[my_last_ingredient] = their_ingredients[their_last_ingredient];
}
std::vector<double> scaleRecipe(const std::vector<double>& amounts_two_portions, int portions){
    std::vector<double> result;

    for(const auto& ingredient : amounts_two_portions){
        result.emplace_back(ingredient * portions / 2);
    }
    return result;
}
void addSecretIngredient(std::vector<std::string> &my_ingredients, const std::string& her_ingredient){
    my_ingredients[my_ingredients.size() - 1] = her_ingredient;
}
}  // namespace lasagna_master

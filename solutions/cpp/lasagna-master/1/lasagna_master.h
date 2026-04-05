#pragma once
#include <string>
#include <vector>

namespace lasagna_master {

struct amount {
    int noodles;
    double sauce;
};

int preparationTime(std::vector<std::string> layers, int prep_time_per_layer=2);
amount quantities(std::vector<std::string> layers);
void addSecretIngredient(std::vector<std::string> &my_ingredients, const std::vector<std::string> &their_ingredients);
std::vector<double> scaleRecipe(std::vector<double> amounts_two_portions, int portions);
void addSecretIngredient(std::vector<std::string> &my_ingredients, std::string her_ingredient);
}  // namespace lasagna_master

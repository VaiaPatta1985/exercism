#include "lasagna_master.h"

namespace lasagna_master {

int preparationTime(std::vector<std::string> layers, int prep_time_per_layer){
    return layers.size()*prep_time_per_layer;
}
amount quantities(std::vector<std::string> layers){
    int layer_num=layers.size();
    int noodles=0, sauce=0;
    amount result;

    for(int layer_idx=0;layer_idx<layer_num;layer_idx++){
        std::string layer=layers[layer_idx];        
        if(layer=="noodles")noodles++;
        if(layer=="sauce")sauce++;
    }
    /*
    result={
        .noodles=noodles*50,
        .sauce=sauce*0.2,
    };
    */
    result.noodles=noodles*50;
    result.sauce=sauce*0.2;
    return result;
}
void addSecretIngredient(std::vector<std::string> &my_ingredients, const std::vector<std::string> &their_ingredients){
    int my_last_ingredient=my_ingredients.size()-1;
    int their_last_ingredient=their_ingredients.size()-1;

    my_ingredients[my_last_ingredient]=their_ingredients[their_last_ingredient];
}
std::vector<double> scaleRecipe(std::vector<double> amounts_two_portions, int portions){
    std::vector<double> result;
    int num_ingredients=amounts_two_portions.size();

    for(int ingredient=0;ingredient<num_ingredients;ingredient++){
        result.emplace_back(amounts_two_portions[ingredient]*portions/2);
    }
    return result;
}
void addSecretIngredient(std::vector<std::string> &my_ingredients, std::string her_ingredient){
    my_ingredients[my_ingredients.size()-1]=her_ingredient;
}
}  // namespace lasagna_master

const int oven_time_in_minutes = 40;
const int prep_minutes_per_layer = 2;

// ovenTime returns the amount in minutes that the lasagna should stay in the
// oven.
int ovenTime() {
    return oven_time_in_minutes;
}

/* remainingOvenTime returns the remaining
   minutes based on the actual minutes already in the oven.
*/
int remainingOvenTime(int actualMinutesInOven) {
    return ovenTime() - actualMinutesInOven;
}

/* preparationTime returns an estimate of the preparation time based on the
   number of layers and the necessary time per layer.
*/
int preparationTime(int numberOfLayers) {
    return prep_minutes_per_layer * numberOfLayers;
}

// elapsedTime calculates the total time spent to create and bake the lasagna so
// far.
int elapsedTime(int numberOfLayers, int actualMinutesInOven) {
    return actualMinutesInOven + preparationTime(numberOfLayers);
}

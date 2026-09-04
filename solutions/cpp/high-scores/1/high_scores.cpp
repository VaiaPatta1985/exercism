#include "high_scores.h"

#include <algorithm>
#include <functional>

namespace arcade {
std::vector<int> HighScores::list_scores() const {
    return scores;
}

int HighScores::latest_score() const {
    return scores.back();
}

int HighScores::personal_best() const {
    return *(std::minmax_element(scores.begin(), scores.end()).second);
}

std::vector<int> HighScores::top_three() const {
    auto result = std::vector<int>(scores);
    std::sort(result.begin(), result.end(), [](int a, int b){return a>b;});
    if (result.size() > 3) result.resize(3);
    return result;
}

}  // namespace arcade

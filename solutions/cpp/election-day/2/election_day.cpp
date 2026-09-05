#include <string>
#include <vector>
#include <functional>

namespace election {

// The election result struct is already created for you:

struct ElectionResult {
    // Name of the candidate
    std::string name{};
    // Number of votes the candidate has
    int votes{};
};
const auto official_address = [](std::string name){return "President " + name;};
int vote_count(ElectionResult& election_result) {
    return election_result.votes;
}
void increment_vote_count(ElectionResult& election_result, int increment) {
    election_result.votes += increment;
}
ElectionResult& determine_result(std::vector<ElectionResult> &final_count){
    auto num_candidates = final_count.size();
    int winner_idx = 0;

    for (long unsigned candidate_idx = 1; candidate_idx < num_candidates;
         candidate_idx++) {
        if (final_count[candidate_idx].votes > final_count[winner_idx].votes) {
            winner_idx = candidate_idx;
        }
    }
    final_count[winner_idx].name = official_address(final_count[winner_idx].name);
    return final_count[winner_idx];
}
}  // namespace election

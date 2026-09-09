#if !defined(ALPHAMETICS_H)
#define ALPHAMETICS_H
#include <map>
#include <string>
#include <vector>
#include <algorithm>
namespace alphametics {
class Icantbebothered {
public:
    Icantbebothered(std::map<char, int> a_map, bool is_nonempty) : the_actual_map{a_map}, nonempty{is_nonempty} {};
    bool has_value() {
        return nonempty;
    };
    std::map<char, int> operator*() const {
        return the_actual_map;
    };
private:
    std::map<char, int> the_actual_map;
    bool nonempty;
};


std::vector<std::vector<int>> subsequences(int first_element, int last_element, int size_of_sub);
std::vector<std::string> get_terms(std::string equation);
std::vector<char> get_letters(std::string equation);
std::vector<char> get_first_letters(std::vector<std::string> terms, std::string sum);
std::vector<std::map<char, int>> combinations(std::vector<char> letters, std::vector<char> first_letters);
std::map<char, int> brute_force_strategy(std::vector<char> letters, std::vector<std::string> terms, std::string sum);
Icantbebothered solve(std::string equation);

}  // namespace alphametics

#endif  // ALPHAMETICS_H

#if !defined(ALPHAMETICS_H)
#define ALPHAMETICS_H
#include <map>
#include <string>
#include <vector>
#include <algorithm>
#include <functional>
namespace alphametics {
class Icantbebothered {
public:
    Icantbebothered(std::map<char, int> a_map) : the_actual_map{a_map} {};
    bool has_value() {
        return !(the_actual_map.empty());
    };
    std::map<char, int> operator*() const {
        return the_actual_map;
    };
private:
    std::map<char, int> the_actual_map;
};


int string_to_int(const std::string& num);
std::vector<std::vector<int>> subsequences(int first_element, int last_element, int size_of_sub);
std::vector<std::string> get_terms(const std::string& equation);
std::vector<char> get_letters(const std::string& equation);
std::vector<char> get_first_letters(const std::vector<std::string>& terms, const std::string& sum);
/*
std::map<char, int> brute_force(const std::vector<char>& letters,
                                const std::vector<char>& first_letters,
                                std::function<bool(std::map<char, int>)> is_solution);
bool general_check(const std::vector<std::string>& terms, const std::string& sum, std::map<char, int> candidate);
*/
std::map<char, int> brute_force(const std::vector<char>& letters, const std::vector<char>& first_letters, std::vector<std::string> terms, std::string sum);
Icantbebothered solve(const std::string& equation);

}  // namespace alphametics

#endif  // ALPHAMETICS_H

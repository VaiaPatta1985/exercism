#if !defined(ALPHAMETICS_H)
#define ALPHAMETICS_H
#define BRUTE_FORCE_RECONSTRUCT     1
#define BRUTE_FORCE_SINGLE_EQUATION 2
#define GRADUALLY_RULING_STUFF_OUT  3
#define SOLUTION                    BRUTE_FORCE_SINGLE_EQUATION
#include <map>
#include <string>
#include <vector>
#include <algorithm>
#include <functional>

namespace alphametics {
class Icantbebothered {
public:
    Icantbebothered(std::array<int, 26> an_array, std::vector<char> letter_set);
    Icantbebothered(std::map<char, int> a_map) : the_actual_map{a_map} {};
    bool has_value() {
        return !(the_actual_map.empty());
    };
    std::map<char, int> operator*() const {
        return the_actual_map;
    };
private:
    std::map<char, int> the_actual_map;
    std::array<int, 26> my_array;
    std::vector<char> letters;
};


std::vector<std::vector<int>> subsequences(int first_element, int last_element, int size_of_sub);
std::vector<std::string> get_terms(const std::string& equation);
std::vector<char> get_letters(const std::string& equation);
std::vector<char> get_first_letters(const std::vector<std::string>& terms, const std::string& sum);
std::vector<char> get_other_letters(const std::vector<char>& letters, const std::vector<char>& first_letters);
#if SOLUTION == GRADUALLY_RULING_STUFF_OUT
std::map<char, int> work_it_out(const std::vector<char>& letters,
                                const std::vector<char>& first_letters,
                                const std::vector<char>& other_letters,
                                const std::vector<std::string>& terms,
                                const std::string& sum);
#endif
#if SOLUTION == BRUTE_FORCE_RECONSTRUCT || SOLUTION == BRUTE_FORCE_SINGLE_EQUATION
std::array<int, 26> brute_force(const std::vector<char>& letters,
                                const std::vector<char>& other_letters,
                                std::function<bool(std::array<int, 26>)> is_solution);
#endif
#if SOLUTION == BRUTE_FORCE_RECONSTRUCT
bool general_check(const std::vector<std::string>& terms, const std::string& sum, const std::map<char, int>& candidate);
int string_to_int(const std::string& num);
#endif
#if SOLUTION == BRUTE_FORCE_SINGLE_EQUATION
bool total_eq_check(const std::array<int, 26>& candidate, const std::array<int, 26>& factor_of,
                    const std::vector<char>& letters);
std::array<int, 26> get_factors(const std::vector<std::string>& terms,
                                const std::string& sum,
                                const std::vector<char>& letters);
#endif
Icantbebothered solve(const std::string& equation);

}  // namespace alphametics

#endif  // ALPHAMETICS_H

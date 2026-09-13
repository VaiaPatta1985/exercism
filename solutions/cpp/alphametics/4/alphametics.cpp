#include "alphametics.h"
// the just-get-it-to-work version
namespace alphametics {
std::vector<std::string> get_terms(const std::string& equation) {
    std::vector<std::string> result;
    std::string term;
    auto idx = 0;
    while (true) {
        while (equation[idx]!=' ') {
            term +=equation[idx++];
        }
        result.push_back(term);
        term = "";
        if (equation[++idx] == '=') {
            break;
        }
        idx += 2;
    }
    return result;
}

std::vector<char> get_letters(const std::string& equation) {
    const int len = equation.length();
    std::vector<char> result;
    std::vector<char> temp;

    for (auto idx = 0; idx < len; idx++) {
        temp.push_back(equation[idx]);
    }
    std::sort(temp.begin(), temp.end());
    
    for (auto idx = 1; idx < len; idx++) {
        if (temp[idx] != temp[idx - 1] && temp[idx] != '=' && temp[idx] != '+' && temp[idx] != ' ') {
            result.push_back(temp[idx]);
        }
    }

    return result;
}
Icantbebothered::Icantbebothered(std::array<int, 26> an_array, std::vector<char> letter_set) : my_array{an_array}, letters{letter_set} {
    if (my_array[0] == 10) {
        the_actual_map = {};
    } else {
        for (auto letter : letters) {
            the_actual_map[letter] = my_array[(int)letter - 'A'];
        }
    }
};
Icantbebothered solve(const std::string& equation) {
    const std::vector<char> letters = get_letters(equation);
    const std::vector<std::string> terms = get_terms(equation);
    const std::string sum = equation.substr(equation.find('=') + 3);
    bool itsjustsumofzeros = sum.length() == 1 && letters.size() == 1;

    for (const auto& term : terms) {
        itsjustsumofzeros = itsjustsumofzeros && term.length() == 1;
    }

    if (itsjustsumofzeros) {
        return Icantbebothered({{letters[0], 0}});
    }

    auto first_letters = get_first_letters(terms, sum);
    auto other_letters = get_other_letters(letters, first_letters);

#if SOLUTION == BRUTE_FORCE_RECONSTRUCT
    auto check = [terms, sum](const std::map<char, int>& combo) {return general_check(terms, sum, combo);};
#endif

#if SOLUTION == BRUTE_FORCE_SINGLE_EQUATION
    const std::array<int, 26> factors = get_factors(terms, sum, letters);
    auto check = [factors, letters](const std::array<int, 26>& combo) {return total_eq_check(combo, factors, letters);};
#endif

#if SOLUTION == BRUTE_FORCE_RECONSTRUCT || SOLUTION == BRUTE_FORCE_SINGLE_EQUATION
    const auto result = brute_force(letters, other_letters, check);
#endif

#if SOLUTION == GRADUALLY_RULING_STUFF_OUT
    const auto result = work_it_out(letters, first_letters, other_letters, terms, sum);
#endif
    return Icantbebothered(result, letters);
}

#if SOLUTION == GRADUALLY_RULING_STUFF_OUT
std::map<char, int> work_it_out(const std::vector<char>& letters,
                                const std::vector<char>& first_letters,
                                const std::vector<char>& other_letters,
                                const std::vector<std::string>& terms,
                                const std::string& sum) {
    std::map<char, std::vector<int>> pools;
    bool still_looking = true;
    for (const auto& letter : first_letters) {
        pools[letter] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    }
    for (const auto& letter : other_letters) {
        pools[letter] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    }
    std::vector<std::vector<int>> carry;
    std::vector<std::vector<int>> minpools;
    std::vector<std::vector<int>> maxpools;
    const int len_sum = sum.length();
    for (auto idx = 0; idx < len_sum - 1; idx++) {
        //minpools[idx] = ...
        //maxpools[idx] = ...
    }
    for (auto idx = 0; idx < len_sum - 1; idx++) {
        //(min of pools at k+1 (start from most numerous letter, second min for second most numerous etc))/10<Sn-Σn=carry[k]<max of pools at k+1 (start from most numerous letter, second max for second most numerous etc)
        //
        //carry = {minpools[idx+1]/10, ..., maxpools[idx+1]}
    }
    carry.push_back({0});
    while (still_looking) {

    }
}
#endif
std::vector<std::vector<int>> subsequences(int first_element, int last_element, int size_of_sub) {
    int total_size = last_element - first_element + 1;
    if (size_of_sub > total_size) {
        return {};
    }
    if (size_of_sub == 0) {
        return {{}};
    }
    std::vector<std::vector<int>> result;
    std::vector<int> temp;
    bool get_the_complementary_sequences = false;
    int size_of_calc_sub;
    if (size_of_sub == total_size) {
        for (auto element = first_element; element <= last_element; element++) {
            temp.push_back(element);
        }
        return {temp};
    }
    if (size_of_sub > total_size / 2) {
        size_of_calc_sub = total_size - size_of_sub;
        get_the_complementary_sequences = true;
    } else {
        size_of_calc_sub = size_of_sub;
    }
    if (size_of_calc_sub == 1) {
        for (auto element = first_element; element <= last_element; element++) {
            result.push_back({element});
        }
    } else {
        auto smaller_subsequences = subsequences(first_element, last_element, size_of_calc_sub - 1);
        for (const auto& subsequence : smaller_subsequences) {
            for (auto element = subsequence[size_of_calc_sub - 2] + 1; element <= last_element; element++) {
                auto new_subsequence = std::vector<int>(subsequence);
                new_subsequence.push_back(element);
                result.push_back(new_subsequence);
            }
        }
    }
    if (get_the_complementary_sequences) {
        std::vector<std::vector<int>> final_result;
        for (const auto& seq : result) {
            auto sub_idx = 0;
            for (auto element = first_element; element <= last_element; element++) {
                if (sub_idx < size_of_calc_sub) {
                    if (element == seq[sub_idx]) {
                        sub_idx++;
                    } else {
                        temp.push_back(element);
                    }
                } else {
                    temp.push_back(element);
                }
            }
            final_result.push_back(temp);
            temp = {};
        }
        return final_result;
    }
    return result;
}

std::vector<char> get_other_letters(const std::vector<char>& letters, const std::vector<char>& first_letters) {
    std::vector<char> other_letters;
    int num_of_letters = letters.size();
    int first_letter_counter{};
    const int num_of_first_letters = first_letters.size();

    for (auto letter : letters) {
        if (first_letter_counter < num_of_first_letters) {
            if (letter == first_letters[first_letter_counter]) {
                first_letter_counter++;
            } else {
                other_letters.push_back(letter);
            }
        } else {
            other_letters.push_back(letter);
        }
    }
    if (num_of_letters < 10) {
        other_letters.push_back('$');
    }
    return other_letters;
}


std::array<int, 26> brute_force(const std::vector<char>& letters,
                                const std::vector<char>& other_letters,
                                std::function<bool(std::array<int, 26>)> is_solution) {
    int num_of_letters = letters.size();
    const auto subsets_len = subsequences(1, 9, num_of_letters);
    const auto subsets_len_minus_1 = subsequences(1, 9, num_of_letters - 1);

    std::array<int, 26> combination;

    for (auto set_to_zero : other_letters) {
        if (set_to_zero != '$') {
            combination[(int)set_to_zero - 'A'] = 0;
        }
        auto digit_subsets = set_to_zero == '$' ? subsets_len : subsets_len_minus_1;
        for (const auto& digit_subset : digit_subsets) {
            auto digit_permutation = std::vector<int>(digit_subset);
            do {
                auto idx = 0;
                for (auto letter : letters) {
                    if (letter != set_to_zero) {
                        combination[(int)letter - 'A'] = digit_permutation[idx++];
                    }
                }
                if (is_solution(combination)) {
                    return combination;
                }
            } while (std::next_permutation(digit_permutation.begin(), digit_permutation.end()));
        }
    }
    combination.fill(10);
    return combination;
}

std::vector<char> get_first_letters(const std::vector<std::string>& terms, const std::string& sum) {
    std::vector<char> result;    
    std::vector<char> temp;
    std::vector<std::string> multidigit_numbers;

    for (const auto& term : terms) {
        if (term.length() > 1) {
            multidigit_numbers.push_back(term);
        }
    }

    multidigit_numbers.push_back(sum);

    for (const auto& num : multidigit_numbers) {
        temp.push_back(num[0]);
    }
    std::sort(temp.begin(), temp.end());
    int len = temp.size();
    result.push_back(temp[0]);

    for (auto idx = 1; idx < len; idx++) {
        if (temp[idx] != temp[idx - 1]) {
            result.push_back(temp[idx]);
        }
    }

    return result;
}
#if SOLUTION == BRUTE_FORCE_RECONSTRUCT
bool general_check(const std::vector<std::string>& terms, const std::string& sum, const std::map<char, int>& candidate) {

    auto c_sum = 0;
    for (const auto& term : terms) {
        std::string digit_term = "";
        for (auto letter : term) {
            digit_term += (char) candidate.at(letter) + '0';
        }
        c_sum += string_to_int(digit_term);
    }
    std::string digit_sum = "";
    for (auto letter : sum) {
        digit_sum += candidate.at(letter) + '0';
    }
    if (string_to_int(digit_sum) == c_sum) {
        return true;
    }

    return false;
}

int string_to_int(const std::string& num) {
    int len = num.length();
    int result = 0;
    int power_of_10 = 1;

    for (auto idx = len - 1; idx >= 0; idx--) {
        result += (num[idx] - '0') * power_of_10;
        power_of_10 *= 10;
    }
    return result;
}
#endif
#if SOLUTION == BRUTE_FORCE_SINGLE_EQUATION
std::array<int, 26> get_factors(const std::vector<std::string>& terms,
                                const std::string& sum,
                                const std::vector<char>& letters) {

    int pow;
    std::array<int, 26> factor_of;

    for (auto letter : letters) {
        factor_of[(int)letter - 'A'] = 0;
    }

    for (const auto& term : terms) {
        int len_term = term.length();
        pow = 1;
        for (auto idx = len_term - 1; idx >= 0; idx--) {
            factor_of[(int)term[idx] - 'A'] += pow;
            pow *= 10;
        }
    }

    int len_sum = sum.length();
    pow = 1;
    for (auto idx = len_sum - 1; idx >= 0; idx--) {
        factor_of[(int)sum[idx] - 'A'] -= pow;
        pow *= 10;
    }
    return factor_of;
}

bool total_eq_check(const std::array<int, 26>& candidate, const std::array<int, 26>& factor_of,
                    const std::vector<char>& letters) {
    auto must_be_0 = 0;
    for (auto letter : letters) {
        must_be_0 += candidate[(int)letter - 'A'] * factor_of[(int)letter - 'A'];
    }
    return must_be_0 == 0;
}
#endif
}  // namespace alphametics

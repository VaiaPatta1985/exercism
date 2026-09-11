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

Icantbebothered solve(const std::string& equation) {
    const std::vector<char> letters = get_letters(equation);
    const std::vector<std::string> terms = get_terms(equation);
    const std::string sum = equation.substr(equation.find('=') + 3);
    //auto check = [terms, sum](const std::map<char, int>& combo) {return general_check(terms, sum, combo);};

    bool itsjustsumofzeros = sum.length() == 1 && letters.size() == 1;

    for (auto term : terms) {
        itsjustsumofzeros = itsjustsumofzeros && term.length() == 1;
    }

    if (itsjustsumofzeros) {
        return Icantbebothered({{letters[0], 0}});
    }

    auto first_letters = get_first_letters(terms, sum);
    //const auto result = brute_force(letters, first_letters, check);
    const auto result = brute_force(letters, first_letters, terms, sum);

    return Icantbebothered(result);
}

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
        for (auto subsequence : smaller_subsequences) {
            for (auto element = subsequence[size_of_calc_sub - 2] + 1; element <= last_element; element++) {
                auto new_subsequence = std::vector<int>(subsequence);
                new_subsequence.push_back(element);
                result.push_back(new_subsequence);
            }
        }
    }
    if (get_the_complementary_sequences) {
        std::vector<std::vector<int>> final_result;
        for (auto seq : result) {
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

std::map<char, int> brute_force(const std::vector<char>& letters,
                                const std::vector<char>& first_letters,
                                //std::function<bool(std::map<char, int>)> is_solution
                                std::vector<std::string> terms, std::string sum
                            ) {
    int num_of_letters = letters.size();
    const auto subsets_len = subsequences(1, 9, num_of_letters);
    const auto subsets_len_minus_1 = subsequences(1, 9, num_of_letters - 1);
    
    int first_letter_counter{}, pow;
    std::vector<char> other_letters;
    std::map<char, int> combination;
    const int num_of_first_letters = first_letters.size();

    std::map<char, int> factor_of;

    for (auto letter : letters) {
        factor_of[letter] = 0;
    }

    for (auto term : terms) {
        int len_term = term.length();
        pow = 1;
        for (auto idx = len_term - 1; idx >= 0; idx--) {
            factor_of[term[idx]] += pow;
            pow *= 10;
        }
    }

    int len_sum = sum.length();
    pow = 1;
    for (auto idx = len_sum - 1; idx >= 0; idx--) {
        factor_of[sum[idx]] -= pow;
        pow *= 10;
    }


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
    for (auto set_to_zero : other_letters) {
        if (set_to_zero != '$') {
            combination[set_to_zero] = 0;
        }
        auto digit_subsets = set_to_zero == '$' ? subsets_len : subsets_len_minus_1;
        for (auto digit_subset : digit_subsets) {
            auto digit_permutation = std::vector<int>(digit_subset);
            do {
                auto idx = 0;
                for (auto letter : letters) {
                    if (letter != set_to_zero) {
                        combination[letter] = digit_permutation[idx++];
                    }
                }
                auto must_be_0 = 0;
                for (auto letter : letters) {
                    must_be_0 += combination[letter] * factor_of[letter];
                }
                if (must_be_0 == 0) {
                    return combination;
                }
            } while (std::next_permutation(digit_permutation.begin(), digit_permutation.end()));
        }
    }

    return {};
}

std::vector<char> get_first_letters(const std::vector<std::string>& terms, const std::string& sum) {
    std::vector<char> result;    
    std::vector<char> temp;
    std::vector<std::string> multidigit_numbers;

    for (auto term : terms) {
        if (term.length() > 1) {
            multidigit_numbers.push_back(term);
        }
    }

    multidigit_numbers.push_back(sum);

    for (auto num : multidigit_numbers) {
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
/*
bool general_check(const std::vector<std::string>& terms, const std::string& sum, std::map<char, int> candidate) {

    auto c_sum = 0;
    for (auto term : terms) {
        std::string digit_term = "";
        for (auto letter : term) {
            digit_term += (char) candidate[letter] + '0';
        }
        c_sum += string_to_int(digit_term);
    }
    std::string digit_sum = "";
    for (auto letter : sum) {
        digit_sum += candidate[letter] + '0';
    }
    if (string_to_int(digit_sum) == c_sum) {
        return true;
    }

    return false;
}
*/
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

}  // namespace alphametics

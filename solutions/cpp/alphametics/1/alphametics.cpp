#include "alphametics.h"
// the just-get-it-to-work version
namespace alphametics {
std::vector<std::string> get_terms(std::string equation) {
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

std::vector<char> get_letters(std::string equation) {
    int len = equation.length();
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

Icantbebothered solve(std::string equation) {
    std::vector<char> letters = get_letters(equation);
    std::vector<std::string> terms = get_terms(equation);
    std::string sum = equation.substr(equation.find('=') + 3);
    std::map<char, int> result = brute_force_strategy(letters, terms, sum);

    return result.empty() ? Icantbebothered(result, false) : Icantbebothered(result, true);
}

std::vector<std::vector<int>> subsequences(int first_element, int last_element, int size_of_sub) {
    std::vector<std::vector<int>> result;
    if (size_of_sub == 1) {
        for (auto idx = first_element; idx <= last_element; idx++) {
            result.push_back({idx});
        }
        return result;
    }
    auto smaller_subsequences = subsequences(first_element, last_element, size_of_sub - 1);
    for (auto subsequence : smaller_subsequences) {
        for (auto idx = subsequence[size_of_sub - 2] + 1; idx <= last_element; idx++) {
            auto new_subsequence = std::vector<int>(subsequence);
            new_subsequence.push_back(idx);
            result.push_back(new_subsequence);
        }
    }
    return result;
}

std::vector<std::map<char, int>> combinations(std::vector<char> letters, std::vector<char> first_letters) {
    int num_of_letters = letters.size();
    std::vector<std::map<char, int>> result;
    const auto subsets_len = subsequences(1, 9, num_of_letters);
    const auto subsets_len_minus_1 = subsequences(1, 9, num_of_letters - 1);
    int k = 0;
    std::vector<char> other_letters;
    std::map<char, int> combination;

    for (auto letter : letters) {
        if (letter == first_letters[k]) {
            k++;
        } else {
            other_letters.push_back(letter);
        }
    }

    other_letters.push_back('$');

    for (auto set_to_zero : other_letters) {
        if (set_to_zero != '$') {
            combination[set_to_zero] = 0;
        }
        auto digit_subsets = set_to_zero == '$' ? subsets_len : subsets_len_minus_1;
        for (auto subb : digit_subsets) {
            auto digit_subset = std::vector<int>(subb);
            do {
                auto idx = 0;
                for (auto letter : letters) {
                    if (letter != set_to_zero) {
                        combination[letter] = digit_subset[idx++];
                    }
                }
                result.push_back(combination);
            } while (std::next_permutation(digit_subset.begin(), digit_subset.end()));
        }
    }

    return result;
}

std::vector<char> get_first_letters(std::vector<std::string> terms, std::string sum) {
    std::vector<char> result;    
    std::vector<char> temp;
    std::vector<std::string> multidigit_numbers;

    for (auto term : terms) {
        if (term.size() > 1) {
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

std::map<char, int> brute_force_strategy(std::vector<char> letters, std::vector<std::string> terms, std::string sum) {
    auto first_letters = get_first_letters(terms, sum);
    const auto combos = combinations(letters, first_letters);
    std::map<char, int> result;

    for (auto candidate : combos) {
        auto c_sum = 0;
        for (auto term : terms) {
            std::string digit_term = "";
            for (auto letter : term) {
                digit_term += (char) candidate[letter] + '0';
            }
            c_sum += atoi(digit_term.data());
        }
        std::string digit_sum = "";
        for (auto letter : sum) {
            digit_sum += candidate[letter] + '0';
        }
        if (atoi(digit_sum.data()) == c_sum) {
            result = candidate;
            break;
        }
    }

    return result;
}

}  // namespace alphametics

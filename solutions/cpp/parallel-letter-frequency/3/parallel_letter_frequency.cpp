#include "parallel_letter_frequency.h"
namespace parallel_letter_frequency {
std::unordered_map<char, int> frequency(const std::vector<std::string_view>& stuff) {
    std::unordered_map<char, int> whole_alphabet_frequency_map = {
        {'a', 0},
        {'b', 0},
        {'c', 0},
        {'d', 0},
        {'e', 0},
        {'f', 0},
        {'g', 0},
        {'h', 0},
        {'i', 0},
        {'j', 0},
        {'k', 0},
        {'l', 0},
        {'m', 0},
        {'n', 0},
        {'o', 0},
        {'p', 0},
        {'q', 0},
        {'r', 0},
        {'s', 0},
        {'t', 0},
        {'u', 0},
        {'v', 0},
        {'w', 0},
        {'x', 0},
        {'y', 0},
        {'z', 0},
    };
    std::vector<std::thread> freq_counters;
    std::vector<std::unordered_map<char, int>*> all_maps;
    int last_idx{};
    for (const auto& phrase : stuff) {
        all_maps.push_back(new std::unordered_map<char, int>(whole_alphabet_frequency_map));
        freq_counters.push_back(std::thread(single_counter, phrase, all_maps[last_idx++]));
    }
    for (auto& freq_counter : freq_counters) {
        freq_counter.join();
    }

    for (const auto& part_map : all_maps) {
        auto partial_map = *part_map;
        for (const auto& char_int_pair : partial_map) {
            auto letter = char_int_pair.first;
            auto freq = char_int_pair.second;
            whole_alphabet_frequency_map.at(letter) += freq;
        }
    }

    std::unordered_map<char, int> result = {};
    for (const auto& char_int_pair : whole_alphabet_frequency_map) {
        auto letter = char_int_pair.first;
        auto freq = char_int_pair.second;
        if (freq != 0) {
            result[letter] = freq;
        }
    }
    return result;
}

void single_counter(const std::string_view& text, std::unordered_map<char, int>* part_map) {
    for (auto letter : text) {
        if (letter >= 'A' && letter <= 'Z') {
            letter += 'a' - 'A';
        }
        if (letter >= 'a' && letter <= 'z') {
            (*part_map)[letter]++;
        }
    }
}
}

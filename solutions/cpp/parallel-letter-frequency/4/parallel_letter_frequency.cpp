#include "parallel_letter_frequency.h"
namespace parallel_letter_frequency {
std::map<char, int> frequency(const std::vector<std::string_view>& stuff) {
    std::vector<std::thread> freq_counters;
    std::array<int, 26> whole_alphabet_frequency_map;
    whole_alphabet_frequency_map.fill(0);
    std::vector<std::array<int, 26>*> all_maps;
    int last_idx{};
    for (const auto& phrase : stuff) {
        all_maps.push_back(new std::array<int, 26>(whole_alphabet_frequency_map));
        freq_counters.push_back(std::thread(single_counter, phrase, all_maps[last_idx++]));
    }
    for (auto& freq_counter : freq_counters) {
        freq_counter.join();
    }

    for (const auto& part_map : all_maps) {
        auto partial_map = *part_map;
        for (auto idx = 0; idx < 26; idx++) {
            whole_alphabet_frequency_map[idx] += partial_map[idx];
        }
    }

    std::map<char, int> result = {};
    for (auto idx = 0; idx < 26; idx++) {
        auto freq = whole_alphabet_frequency_map[idx];
        if (freq != 0) {
            result[(char)idx + 'a'] = freq;
        }
    }
    return result;
}

void single_counter(const std::string_view& text, std::array<int, 26>* part_map) {
    for (auto letter : text) {
        if (letter >= 'A' && letter <= 'Z') {
            letter += 'a' - 'A';
        }
        if (letter >= 'a' && letter <= 'z') {
            (*part_map)[(int)letter - 'a']++;
        }
    }
}
}

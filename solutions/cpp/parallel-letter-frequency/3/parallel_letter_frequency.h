#pragma once
#include <vector>
#include <unordered_map>
#include <string_view>
#include <algorithm>
#include <thread>
#include <functional>

namespace parallel_letter_frequency {
    std::unordered_map<char, int> frequency(const std::vector<std::string_view>& stuff);
    void single_counter(const std::string_view& text, std::unordered_map<char, int>* part_map);
}

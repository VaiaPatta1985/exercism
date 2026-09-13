#pragma once
#include <vector>
#include <map>
#include <string_view>
#include <algorithm>
#include <thread>
#include <functional>

namespace parallel_letter_frequency {
    std::map<char, int> frequency(const std::vector<std::string_view>& stuff);
    void single_counter(const std::string_view& text, std::map<char, int>* part_map);
}

#pragma once
#include <vector>
#include <map>
#include <array>
#include <string_view>
#include <algorithm>
#include <thread>
#include <functional>

namespace parallel_letter_frequency {
    std::map<char, int> frequency(const std::vector<std::string_view>& stuff);
    void single_counter(const std::string_view& text, std::array<int, 26>* part_map);
}

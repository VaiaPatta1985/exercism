#pragma once
#include <string>
#include <vector>
#include <functional>

namespace twelve_days {
const std::vector<std::string> day_order = {
    "",
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth",
};
const std::vector<std::string> phrase_end = {
    "",
    ".\n",
    ", and ",
    ", ",
};
const std::vector<std::string> presents = {
    "",
    "a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming",
};
const int num_of_endings = phrase_end.size();
const std::string verse_link = "\n";
const auto intro = [](int position) {
    return "On the " +
           day_order[position] +
           " day of Christmas my true love gave to me: ";
};
std::string recite(int first, int last);
std::string verse(int position);

}  // namespace twelve_days

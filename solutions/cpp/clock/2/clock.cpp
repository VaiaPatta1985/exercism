#include "clock.h"

namespace date_independent {
    clock::clock(int hour, int minute) {
        hour += minute / 60;
        minute %= 60;
        if (minute < 0) {
            minute += 60;
            hour--;
        }
        hour %= 24;
        if (hour < 0) {
            hour += 24;
        }
        this->hour = hour;
        this->minute = minute;
    }
    clock clock::at(int h, int m) {
        return clock(h, m);
    }
    clock clock::plus(int mins) {
        return clock(hour, minute + mins);
    }
    clock clock::minus(int mins) {
        return clock(hour, minute - mins);
    }
    clock::operator std::string() const {
        auto str_hour =
            hour < 10 ? "0" + std::to_string(hour)
                      : std::to_string(hour);
        auto str_minute =
            minute < 10 ? "0" + std::to_string(minute)
                        : std::to_string(minute);
        return str_hour + ":" + str_minute;
    }
    bool clock::operator==(const clock& other) const {
        return hour == other.hour && minute == other.minute;
    }
    bool clock::operator!=(const clock& other) const {
        return !(*this == other);
    }
}  // namespace date_independent

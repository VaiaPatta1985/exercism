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
        return clock(this->hour, this->minute + mins);
    }
    clock clock::minus(int mins) {
        return clock(this->hour, this->minute - mins);
    }/*
    clock clock::plus(clock other) {
        return clock(this->hour + other.hour, this->minute + other.minute);
    }
    clock clock::minus(clock other) {
        return clock(this->hour - other.hour, this->minute - other.minute);
    }*/
    clock::operator std::string() const {
        auto str_hour =
            this->hour < 10 ? "0" + std::to_string(this->hour)
                            : std::to_string(this->hour);
        auto str_minute =
            this->minute < 10 ? "0" + std::to_string(this->minute)
                              : std::to_string(this->minute);
        return str_hour + ":" + str_minute;
    }
    bool clock::operator==(clock other) const {
        return this->hour == other.hour && this->minute == other.minute;
    }
    bool clock::operator!=(clock other) const {
        return !(*this == other);
    }
}  // namespace date_independent

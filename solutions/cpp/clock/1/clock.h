#pragma once
#include <string>
namespace date_independent {

class clock {
    public:
    int hour;
    int minute;

    clock(int hour=0, int minute=0);
    
    static clock at(int h, int m);
    clock plus(int mins);
    clock minus(int mins);/*
    clock plus(clock other);
    clock minus(clock other);*/

    explicit operator std::string() const;

    bool operator==(clock other) const;
    bool operator!=(clock other) const;
    private:
};

}  // namespace date_independent

#pragma once
#include <boost/date_time/gregorian/gregorian.hpp>
namespace meetup {
using namespace boost::gregorian;
    
class scheduler {
    private:
    date nth_wkday(nth_day_of_the_week_in_month::week_num gweeknum,
                   greg_weekday gweekday) const;
    date teenth(greg_weekday gweekday) const;
    public:
    greg_month month;
    int year;

    scheduler(greg_month gmonth, int year);
    
    date first_sunday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Sunday);};
    date first_monday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Monday);};
    date first_tuesday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Tuesday);};
    date first_wednesday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Wednesday);};
    date first_thursday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Thursday);};
    date first_friday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Friday);};
    date first_saturday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Saturday);};
    date second_sunday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Sunday);};
    date second_monday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Monday);};
    date second_tuesday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Tuesday);};
    date second_wednesday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Wednesday);};
    date second_thursday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Thursday);};
    date second_friday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Friday);};
    date second_saturday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Saturday);};    
    date third_sunday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Sunday);};
    date third_monday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Monday);};
    date third_tuesday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Tuesday);};
    date third_wednesday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Wednesday);};
    date third_thursday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Thursday);};
    date third_friday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Friday);};
    date third_saturday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Saturday);};
    date fourth_sunday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Sunday);};
    date fourth_monday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Monday);};
    date fourth_tuesday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Tuesday);};
    date fourth_wednesday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Wednesday);};
    date fourth_thursday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Thursday);};
    date fourth_friday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Friday);};
    date fourth_saturday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Saturday);};
    date last_sunday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Sunday);};
    date last_monday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Monday);};
    date last_tuesday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Tuesday);};
    date last_wednesday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Wednesday);};
    date last_thursday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Thursday);};
    date last_friday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Friday);};
    date last_saturday() const {return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Saturday);};

    date sunteenth() const {return teenth(Sunday);};
    date monteenth() const {return teenth(Monday);};
    date tuesteenth() const {return teenth(Tuesday);};
    date wednesteenth() const {return teenth(Wednesday);};
    date thursteenth() const {return teenth(Thursday);};
    date friteenth() const {return teenth(Friday);};
    date saturteenth() const {return teenth(Saturday);};
};
}  // namespace meetup

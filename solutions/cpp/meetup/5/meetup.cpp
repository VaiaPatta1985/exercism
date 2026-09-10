#include "meetup.h"

namespace meetup {
using namespace boost::gregorian;

date scheduler::nth_wkday(nth_day_of_the_week_in_month::week_num gweeknum,
                          greg_weekday gweekday) const {
    auto the_date = nth_day_of_the_week_in_month(gweeknum, gweekday, month);
    return the_date.get_date(year);
}

date scheduler::teenth(greg_weekday gweekday) const {
    date start(year, month, 13);
    return start + days_until_weekday(start, gweekday);
}

scheduler::scheduler(greg_month gmonth, int gyear) : month(gmonth), year(gyear) {}


date scheduler::sunteenth() const {
    return teenth(Sunday);
}

date scheduler::monteenth() const {
    return teenth(Monday);
}

date scheduler::tuesteenth() const {
    return teenth(Tuesday);
}

date scheduler::wednesteenth() const {
    return teenth(Wednesday);
}

date scheduler::thursteenth() const {
    return teenth(Thursday);
}

date scheduler::friteenth() const {
    return teenth(Friday);
}

date scheduler::saturteenth() const {
    return teenth(Saturday);
}


date scheduler::first_sunday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Sunday);
}

date scheduler::first_monday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Monday);
}

date scheduler::first_tuesday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Tuesday);
}

date scheduler::first_wednesday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Wednesday);
}

date scheduler::first_thursday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Thursday);
}

date scheduler::first_friday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Friday);
}

date scheduler::first_saturday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::first, Saturday);
}

date scheduler::second_sunday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Sunday);
}

date scheduler::second_monday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Monday);
}

date scheduler::second_tuesday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Tuesday);
}

date scheduler::second_wednesday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Wednesday);
}

date scheduler::second_thursday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Thursday);
}

date scheduler::second_friday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Friday);
}

date scheduler::second_saturday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::second, Saturday);
}    
date scheduler::third_sunday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Sunday);
}

date scheduler::third_monday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Monday);
}

date scheduler::third_tuesday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Tuesday);
}

date scheduler::third_wednesday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Wednesday);
}

date scheduler::third_thursday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Thursday);
}

date scheduler::third_friday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Friday);
}

date scheduler::third_saturday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::third, Saturday);
}

date scheduler::fourth_sunday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Sunday);
}

date scheduler::fourth_monday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Monday);
}

date scheduler::fourth_tuesday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Tuesday);
}

date scheduler::fourth_wednesday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Wednesday);
}

date scheduler::fourth_thursday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Thursday);
}

date scheduler::fourth_friday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Friday);
}

date scheduler::fourth_saturday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fourth, Saturday);
}

date scheduler::last_sunday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Sunday);
}

date scheduler::last_monday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Monday);
}

date scheduler::last_tuesday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Tuesday);
}

date scheduler::last_wednesday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Wednesday);
}

date scheduler::last_thursday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Thursday);
}

date scheduler::last_friday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Friday);
}

date scheduler::last_saturday() const {
    return nth_wkday(nth_day_of_the_week_in_month::week_num::fifth, Saturday);
}
}  // namespace meetup

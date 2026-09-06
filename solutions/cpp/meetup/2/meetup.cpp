#include "meetup.h"

namespace meetup {
using namespace boost::gregorian;
date scheduler::letmesee(nth_day_of_the_week_in_month::week_num gweeknum, greg_weekday gdaynum) const {
        auto the_date = nth_day_of_the_week_in_month(gweeknum, gdaynum, this->month);
        return the_date.get_date(this->year);
}
date scheduler::teenth(greg_weekday gdaynum) const {
    date start(this->year, this->month, 13);
    return start + days_until_weekday(start, gdaynum);
}
scheduler::scheduler(greg_month gmonth, int year) : month(gmonth), year(year) {}

}  // namespace meetup

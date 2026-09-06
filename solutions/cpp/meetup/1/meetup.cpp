#include "meetup.h"

namespace meetup {
using namespace boost::gregorian;
date scheduler::letmesee(nth_day_of_the_week_in_month::week_num gweeknum, greg_weekday gdaynum) const {
        auto the_date = nth_day_of_the_week_in_month(gweeknum, gdaynum, this->month);
        return the_date.get_date(this->year);
}
date scheduler::teenth(greg_weekday gdaynum) const {
    date start(this->year, this->month, 13);
    date ending(this->year, this->month, 19);
    for (auto result = start; result < ending; result += days(1)) {
        if (result.day_of_week() == gdaynum) {
            return result;
        }
    }
    return ending;
}
scheduler::scheduler(greg_month gmonth, int year) : month(gmonth), year(year) {}

}  // namespace meetup

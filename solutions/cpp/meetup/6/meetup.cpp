#include "meetup.h"

namespace meetup {
using namespace boost::gregorian;

date scheduler::nth_wkday(nth_day_of_the_week_in_month::week_num gweeknum,
                          greg_weekday gweekday, greg_month a_month, int a_year) {
    auto the_date = nth_day_of_the_week_in_month(gweeknum, gweekday, a_month);
    return the_date.get_date(a_year);
}

date scheduler::teenth(greg_weekday gweekday, greg_month a_month, int a_year) {
    date start(a_year, a_month, 13);
    return start + days_until_weekday(start, gweekday);
}

scheduler::scheduler(greg_month gmonth, int gyear) : month(gmonth), year(gyear) {
	for (auto idx = 0; idx <= 6; idx++) {
		*(fv[idx]) = [this, idx] {
            return f(this->teenth, boost::date_time::weekdays(idx));
        };//
	}

	for (auto wk = 0; wk <= 4; wk++) {
		for (auto idx = 0; idx <= 6; idx++) {
			*(fw[wk][idx]) = [this, wk, idx] {
                return g(this->nth_wkday, nth_day_of_the_week_in_month::week_num(wk + 1),
                         boost::date_time::weekdays(idx));
            };//
		}
	}
}

date scheduler::f(std::function<date(greg_weekday, greg_month, int)> lam, greg_weekday my_day) {
	return lam(my_day, month, year);
}

date scheduler::g(std::function<date(nth_day_of_the_week_in_month::week_num, greg_weekday, greg_month, int)> lam, nth_day_of_the_week_in_month::week_num wk_num, greg_weekday my_day) {
	return lam(wk_num, my_day, month, year);
}


}  // namespace meetup
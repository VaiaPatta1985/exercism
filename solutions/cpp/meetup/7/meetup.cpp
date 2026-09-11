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
	for (auto wkd = 0; wkd <= 6; wkd++) {
		*(teenth_functions[wkd]) = [this, wkd] {
            return appoint_teenth_functions(
                this->teenth,
                boost::date_time::weekdays(wkd)
            );
        };
	}

	for (auto wk = 0; wk <= 4; wk++) {
		for (auto wkd = 0; wkd <= 6; wkd++) {
			*(nth_wkday_functions[wk][wkd]) = [this, wk, wkd] {
                return appoint_nth_wkday_functions(
                    this->nth_wkday,
                    nth_day_of_the_week_in_month::week_num(wk + 1),
                    boost::date_time::weekdays(wkd)
                );
            };
		}
	}
}

date scheduler::appoint_teenth_functions(
    std::function<date(greg_weekday, greg_month, int)> general_teenth_function,
    greg_weekday my_day
) {
	return general_teenth_function(my_day, month, year);
}

date scheduler::appoint_nth_wkday_functions(
    std::function<date(
        nth_day_of_the_week_in_month::week_num, greg_weekday, greg_month, int
    )> general_nth_wkday_function,
    nth_day_of_the_week_in_month::week_num wk_num,
    greg_weekday my_day
) {
	return general_nth_wkday_function(wk_num, my_day, month, year);
}
}  // namespace meetup
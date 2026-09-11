#pragma once
#include <boost/date_time/gregorian/gregorian.hpp>
namespace meetup {
using namespace boost::gregorian;
    
class scheduler {
private:
	std::vector<std::function<date()>*> teenth_functions = {
        &sunteenth, &monteenth, &tuesteenth, &wednesteenth,
        &thursteenth, &friteenth, &saturteenth
    };
	std::vector<std::vector<std::function<date()>*>> nth_wkday_functions = {
        {&first_sunday, &first_monday, &first_tuesday, &first_wednesday,
         &first_thursday, &first_friday, &first_saturday},
        {&second_sunday, &second_monday, &second_tuesday, &second_wednesday,
         &second_thursday, &second_friday, &second_saturday},
        {&third_sunday, &third_monday, &third_tuesday, &third_wednesday,
         &third_thursday, &third_friday, &third_saturday},
        {&fourth_sunday, &fourth_monday, &fourth_tuesday, &fourth_wednesday,
         &fourth_thursday, &fourth_friday, &fourth_saturday},
        {&last_sunday, &last_monday, &last_tuesday, &last_wednesday,
         &last_thursday, &last_friday, &last_saturday}
    };

    date appoint_teenth_functions(
        std::function<date(greg_weekday, greg_month, int)> general_teenth_function,
        greg_weekday my_day
    );
	date appoint_nth_wkday_functions(
        std::function<date(
            nth_day_of_the_week_in_month::week_num, greg_weekday, greg_month, int
        )> general_nth_wkday_function,
        nth_day_of_the_week_in_month::week_num wk_num,
        greg_weekday my_day
    );
    static date nth_wkday(nth_day_of_the_week_in_month::week_num gweeknum,
                          greg_weekday gweekday, greg_month a_month, int a_year);
    static date teenth(greg_weekday gweekday, greg_month a_month, int a_year);
public:
    greg_month month;
    int year;

    scheduler(greg_month gmonth, int gyear);

    std::function<date()> sunteenth, monteenth, tuesteenth, wednesteenth,
                          thursteenth, friteenth, saturteenth,
                          first_sunday, first_monday, first_tuesday, first_wednesday,
                          first_thursday, first_friday, first_saturday,
                          second_sunday, second_monday, second_tuesday, second_wednesday,
                          second_thursday, second_friday, second_saturday,
                          third_sunday, third_monday, third_tuesday, third_wednesday,
                          third_thursday, third_friday, third_saturday,
                          fourth_sunday, fourth_monday, fourth_tuesday, fourth_wednesday,
                          fourth_thursday, fourth_friday, fourth_saturday,
                          last_sunday, last_monday, last_tuesday, last_wednesday,
                          last_thursday, last_friday, last_saturday;
};
}  // namespace meetup
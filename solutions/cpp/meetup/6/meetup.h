#pragma once
#include <boost/date_time/gregorian/gregorian.hpp>
namespace meetup {
using namespace boost::gregorian;
    
class scheduler {
private:
	std::vector<std::function<date()>*> fv = {
        &sunteenth, &monteenth, &tuesteenth, &wednesteenth,
        &thursteenth, &friteenth, &saturteenth
    };
	std::vector<std::vector<std::function<date()>*>> fw = {
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
	
	date g(std::function<date(nth_day_of_the_week_in_month::week_num, greg_weekday, greg_month, int)> lam, nth_day_of_the_week_in_month::week_num wk_num, greg_weekday my_day);
	date f(std::function<date(greg_weekday, greg_month, int)> lam, greg_weekday my_day);
    static date nth_wkday(nth_day_of_the_week_in_month::week_num gweeknum, greg_weekday gweekday, greg_month a_month, int a_year);
    static date teenth(greg_weekday gweekday, greg_month a_month, int a_year);
public:
    greg_month month;
    int year;

    scheduler(greg_month gmonth, int gyear);

    std::function<date()> sunteenth;
    std::function<date()> monteenth;
    std::function<date()> tuesteenth;
    std::function<date()> wednesteenth;
    std::function<date()> thursteenth;
    std::function<date()> friteenth;
    std::function<date()> saturteenth;
    
    std::function<date()> first_sunday;
    std::function<date()> first_monday;
    std::function<date()> first_tuesday;
    std::function<date()> first_wednesday;
    std::function<date()> first_thursday;
    std::function<date()> first_friday;
    std::function<date()> first_saturday;
    std::function<date()> second_sunday;
    std::function<date()> second_monday;
    std::function<date()> second_tuesday;
    std::function<date()> second_wednesday;
    std::function<date()> second_thursday;
    std::function<date()> second_friday;
    std::function<date()> second_saturday;
    std::function<date()> third_sunday;
    std::function<date()> third_monday;
    std::function<date()> third_tuesday;
    std::function<date()> third_wednesday;
    std::function<date()> third_thursday;
    std::function<date()> third_friday;
    std::function<date()> third_saturday;
    std::function<date()> fourth_sunday;
    std::function<date()> fourth_monday;
    std::function<date()> fourth_tuesday;
    std::function<date()> fourth_wednesday;
    std::function<date()> fourth_thursday;
    std::function<date()> fourth_friday;
    std::function<date()> fourth_saturday;
    std::function<date()> last_sunday;
    std::function<date()> last_monday;
    std::function<date()> last_tuesday;
    std::function<date()> last_wednesday;
    std::function<date()> last_thursday;
    std::function<date()> last_friday;
    std::function<date()> last_saturday;
};
}  // namespace meetup
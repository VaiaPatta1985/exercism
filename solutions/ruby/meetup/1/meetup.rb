require 'time'
class Meetup
  PROPER_ORDINALS = [:first, :second, :third, :fourth]
  WEEKDAYS = [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]

  def initialize(month, year)
    @month = month
    @year = year
    first_day = Date.new(year, month, 1)
    last_week_start = (month == 12 ? Date.new(year + 1, 1, 1) - 7 : Date.new(year, month + 1, 1) - 7)
    @last_week_start_day = last_week_start.day
    @first_weekday_order = first_day.cwday % 7
    @last_week_start_weekday_order = last_week_start.cwday % 7
    first_teenth_day = Date.new(year, month, 13)
    @first_teenth_day_weekday_order = first_teenth_day.cwday % 7
  end

  def day(weekday, ordinal)
    proper_ordinal = PROPER_ORDINALS.index(ordinal)
    weekday_order = WEEKDAYS.index(weekday)
    return Date.new(@year, @month, 7 * proper_ordinal + 1 + (weekday_order - @first_weekday_order) % 7) unless proper_ordinal.nil?
    return Date.new(@year, @month, @last_week_start_day + (weekday_order - @last_week_start_weekday_order) % 7) if ordinal == :last
    return Date.new(@year, @month, 13 + (weekday_order - @first_teenth_day_weekday_order) % 7) if ordinal == :teenth
  end
end

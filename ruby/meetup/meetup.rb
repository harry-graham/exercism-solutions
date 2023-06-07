require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, week)
    start_date = start_date_for(weekday, week)
    next_weekday_starting_from(start_date, weekday, week)
  end

  private

  def start_date_for(weekday, week)
    if week == :last
      Date.new(start_year_for_last_week, start_month_for_last_week, 1) - 1
    else
      Date.new(@year, @month, first_day_of_week(week))
    end
  end

  def start_year_for_last_week
    @month == 12 ? @year + 1 : @year
  end

  def start_month_for_last_week
    @month == 12 ? 1 : @month + 1
  end

  def first_day_of_week(week)
    {
      'first' => 1,
      'second' => 8,
      'third' => 15,
      'fourth' => 22,
      'last' => 20,
      'teenth' => 13
    }[week.to_s]
  end

  def day_of_week(weekday)
    Date.strptime(weekday.to_s, '%A').wday
  end

  def next_weekday_starting_from(start_date, weekday, week)
    date = start_date

    if week == :last
      date -= 1 until date.wday == day_of_week(weekday)
    else
      date += 1 until date.wday == day_of_week(weekday)
    end

    date
  end
end

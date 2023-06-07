require 'date'

class Meetup
  WEEKS = %i[first second third fourth].freeze

  def initialize(month, year)
    @month = month
    @year = year

    @days_of_month = Date.new(year, month, 1)..Date.new(year, month, -1)
  end

  def day(weekday, week)
    weekdays = @days_of_month.select { |day| day.wday == day_of_week(weekday) }

    case week
    when :last
      weekdays.last
    when :teenth
      weekdays.find { |day| (13..19).include?(day.day) }
    else
      weekdays[WEEKS.index(week)]
    end
  end

  private

  def day_of_week(weekday)
    Date.strptime(weekday.to_s, '%A').wday
  end
end

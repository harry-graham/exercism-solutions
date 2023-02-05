class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour, @minute = hours_and_minutes(hour, minute)
  end

  def to_s
    "%02d:%02d" % [hour, minute]
  end

  def +(clock)
    Clock.new(hour: hour + clock.hour, minute: minute + clock.minute)
  end

  def -(clock)
    Clock.new(hour: hour - clock.hour, minute: minute - clock.minute)
  end

  def ==(clock)
    hour == clock.hour && minute == clock.minute
  end

  private

  def hours_and_minutes(hours, minutes)
    remainder, m = minutes.divmod(60)
    h = (hours + remainder) % 24
    [h, m]
  end
end

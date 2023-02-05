=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end

class Microwave
  attr_accessor :minutes, :seconds

  def initialize(total_seconds)
    @minutes, @seconds = total_seconds.divmod(100)
    account_for_seconds_overflow
  end

  def timer
    "#{formatted_minutes}:#{formatted_seconds}"
  end

  def formatted_minutes
    "%02d" % minutes
  end

  def formatted_seconds
    "%02d" % seconds
  end

  private def account_for_seconds_overflow
    return if @seconds < 60

    @seconds -= 60
    @minutes += 1
  end
end

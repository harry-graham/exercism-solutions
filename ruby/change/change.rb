# Was unable to work out the algorithm myself, so had to refer to community
# solutions for guidance. Was guided by:
# https://exercism.org/tracks/ruby/exercises/change/solutions/rdlu
# https://exercism.org/tracks/ruby/exercises/change/solutions/mstranger

class Change
  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end

  def self.generate(coins, target)
    raise NegativeTargetError if target.negative?

    return [] if target.zero?

    (1..(target / coins.min)).each do |i|
      arr = coins.repeated_combination(i).find { |combo| combo.sum == target }

      return arr if arr
    end

    raise ImpossibleCombinationError
  end
end

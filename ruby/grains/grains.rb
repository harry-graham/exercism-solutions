class Grains
  VALID_SQUARES = [*1..64]

  class << self
    def square(num)
      validate_square_number(num)
      2 ** (num - 1)
    end

    def total
      VALID_SQUARES.map { |num| square(num) }.sum
    end

    def validate_square_number(num)
      raise ArgumentError unless VALID_SQUARES.include?(num)
    end
  end
end

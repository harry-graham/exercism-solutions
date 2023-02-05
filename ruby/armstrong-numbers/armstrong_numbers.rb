class ArmstrongNumbers
  class << self
    def include?(num)
      num == armstrong_value_of(num)
    end

    private

    def armstrong_value_of(num)
      num.digits.map { |x| x ** number_of_digits(num) }.sum
    end

    def number_of_digits(num)
      num.to_s.size
    end
  end
end

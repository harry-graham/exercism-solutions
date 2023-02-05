class SumOfMultiples
  def initialize(*divisors)
    @divisors = divisors
  end

  def to(limit)
    multiples_up_to(limit).sum
  end

  private

  def multiples_up_to(limit)
    (1...limit).select { |i| multiple_of_a_divisor?(i) }
  end

  def multiple_of_a_divisor?(i)
    @divisors.any? { |divisor| i % divisor == 0 }
  end
end

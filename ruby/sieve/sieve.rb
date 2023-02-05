class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def primes
    numbers_to_check = [*2..limit]
    result = []
    while !numbers_to_check.empty? do
      prime = numbers_to_check.shift
      result << prime
      numbers_to_check -= multiples_of(prime)
    end
    result
  end

  private

  def multiples_of(n)
    [*2..(limit / n)].map { |x| x * n }
  end
end

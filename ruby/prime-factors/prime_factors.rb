class PrimeFactors
  class << self
    def of(n)
      new.of(n)
    end
  end

  def of(n)
    return [] if n < 2

    calculate_prime_factors([], n)
  end

  private

  def calculate_prime_factors(prime_factors, current_value)
    next_prime_factor = prime_factor_of(current_value)

    return prime_factors + [current_value] if next_prime_factor.nil?

    calculate_prime_factors(
      prime_factors + [next_prime_factor],
      current_value / next_prime_factor
    )
  end

  def prime_factor_of(n)
    (2..(n / 2)).find { |d| n % d == 0 }
  end
end

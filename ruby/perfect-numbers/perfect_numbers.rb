class PerfectNumber
  class << self
    def classify(n)
      raise RuntimeError unless n.positive?

      val = aliquot_sum(n)
      case
      when val == n then 'perfect'
      when val > n then 'abundant'
      when val < n then 'deficient'
      end
    end

    def aliquot_sum(n)
      aliquot_factors_of(n).sum
    end

    def aliquot_factors_of(n)
      factors_of(n) - [n]
    end

    def factors_of(n)
      factors = []
      [*1..(Math.sqrt(n).floor)].each do |i|
        next unless n % i == 0
        factors += [i, n / i]
      end
      factors.sort.uniq
    end
  end
end

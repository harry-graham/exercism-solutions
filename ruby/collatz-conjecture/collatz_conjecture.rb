class CollatzConjecture
  class << self
    def steps(n)
      validate_input(n)

      counter = 0
      while (n > 1)
        counter += 1
        n = number_in_sequence_after(n)
      end
      counter
    end

    def validate_input(n)
      raise ArgumentError unless n.positive?
    end

    def number_in_sequence_after(n)
      n % 2 == 0 ? n / 2 : (3 * n) + 1
    end
  end
end

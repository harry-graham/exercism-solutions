# All credit to gchan's solution, which I had to use for guidance on this.
# I tried doing it on my own, but got no way near and ended up with a ridiculously
# complex unscalable solution that only solved the encode test cases.
# The trick gchan used with cycle and zip is amazing! TIL.

class RailFenceCipher
  class << self
    def encode(msg, num_rails)
      zigzag(msg.length, num_rails)
        .zip(msg.chars)
        .sort
        .map(&:last)
        .join
    end

    def decode(msg, num_rails)
      zigzag(msg.length, num_rails)
        .sort
        .zip(msg.chars)
        .sort_by { |arr, _| arr[1] }
        .map(&:last)
        .join
    end

    private

    def zigzag(size, num_rails)
      zigzag_pattern(num_rails).cycle.first(size).zip(0..size)
    end

    def zigzag_pattern(num_rails)
      (0..(num_rails - 1)).to_a + (1..(num_rails - 2)).to_a.reverse
    end
  end
end

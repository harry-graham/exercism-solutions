class Triplet
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    a < b && b < c && a ** 2 + b ** 2 == c ** 2
  end

  class << self
    def where(sum: nil, min_factor: 3, max_factor: 5)
      result = []
      c = min_factor + 2

      while (c <= max_factor) do
        a = min_factor
        b = a + 1
        (b..(c - 1)).each do |j|
          (a..(j - 1)).each do |i|
            triplet = Triplet.new(i, j, c)
            next if sum && sum != triplet.sum
            next unless triplet.pythagorean?
            result << triplet
          end
        end
        c += 1
      end

      result
    end
  end
end
 
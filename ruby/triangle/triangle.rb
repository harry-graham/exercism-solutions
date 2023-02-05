class Triangle
  attr_reader :sides

  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    is_a_triangle? && number_of_unique_sides == 1
  end

  def isosceles?
    is_a_triangle? && number_of_unique_sides <= 2
  end

  def scalene?
    is_a_triangle? && number_of_unique_sides == 3
  end

  private

  def is_a_triangle?
    all_sides_positive? && triangle_inequality?
  end

  def all_sides_positive?
    sides.all?(&:positive?)
  end

  def triangle_inequality?
    longest_side <= shorter_two_sides.sum
  end

  def longest_side
    sides.sort.last
  end

  def shorter_two_sides
    sides.sort[0..-2]
  end

  def number_of_unique_sides
    sides.uniq.size
  end
end

=begin
Write your code for the 'Resistor Color Trio' exercise in this file. Make the tests in
`resistor_color_trio_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-trio` directory.
=end

class ResistorColorTrio
  attr_reader :colors

  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def initialize(colors)
    @colors = colors
    
  end

  def label
    raise ArgumentError unless all_colors_valid?

    if ohms.length > 3
      display_value = ohms[0..-4]
      display_unit = "kiloohms"
    else
      display_value = ohms
      display_unit = "ohms"
    end

    "Resistor value: #{display_value} #{display_unit}"
  end

  private

  def all_colors_valid?
    colors.all? { |color| COLORS.include?(color) }
  end

  def first_two_digits
    colors.first(2).map { |color| COLORS.index(color) }
  end

  def number_of_zeroes
    COLORS.index(colors[2])
  end

  def ohms
    first_two_digits.join("") + ("0" * number_of_zeroes)
  end
end

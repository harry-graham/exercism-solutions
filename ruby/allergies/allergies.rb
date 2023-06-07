class Allergies
  POTENTIAL_ALLERGENS = [
    [128, 'cats'],
    [64, 'pollen'],
    [32, 'chocolate'],
    [16, 'tomatoes'],
    [8, 'strawberries'],
    [4, 'shellfish'],
    [2, 'peanuts'],
    [1, 'eggs']
  ].freeze

  attr_reader :list

  def initialize(score)
    @score = score
    @list = []

    calculate_and_set_list!
  end

  def allergic_to?(item)
    list.include?(item)
  end

  private

  def calculate_and_set_list!
    remainder = @score
    remainder %= 256

    POTENTIAL_ALLERGENS.each do |value, item|
      next unless remainder / value > 0

      remainder -= value
      @list.unshift(item)
    end
  end
end

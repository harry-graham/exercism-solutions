class Palindromes
  attr_reader :max_factor, :min_factor

  Palindrome = Struct.new(:value, :factors)
  
  def initialize(min_factor: 1, max_factor: nil)
    @min_factor = min_factor
    @max_factor = max_factor
  end

  def generate
    results = {}
    (min_factor..max_factor).each do |i|
      (i..max_factor).each do |j|
        product = i * j
        next unless palindrome?(product)
        results[product] ||= []
        results[product] << [i, j]
      end
    end
    @palindromes = results
  end

  def largest
    new_palindrome(@palindromes.keys.max)
  end

  def smallest
    new_palindrome(@palindromes.keys.min)
  end

  private

  def palindrome?(n)
    n.to_s == n.to_s.reverse
  end

  def new_palindrome(val)
    Palindrome.new(val, factors_for(val))
  end

  def factors_for(val)
    @palindromes[val]
  end
end

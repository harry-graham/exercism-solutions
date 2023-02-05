class Raindrops
  class << self
    def convert(n)
      result = ""
      result += "Pling" if n % 3 == 0
      result += "Plang" if n % 5 == 0
      result += "Plong" if n % 7 == 0
      result = n.to_s if result.empty?
      result
    end
  end
end
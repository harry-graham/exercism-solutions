# Refactored using https://exercism.org/tracks/ruby/exercises/isbn-verifier/solutions/jchunky
class IsbnVerifier
  VALID_STRING_FORMAT = /^\d{9}[\dX]$/

  class << self
    def valid?(string)
      string = string.delete("-")
      
      return false unless string.match?(VALID_STRING_FORMAT)

      total = string.chars
        .map { |n| n == "X" ? 10 : n.to_i }
        .map.with_index { |n, i| n * (10 - i) }
        .sum
      
      total % 11 == 0
    end
  end
end

module Luhn
  def self.valid?(str)
    LuhnValidator.new(str).perform
  end

  class LuhnValidator
    attr_reader :str

    def initialize(str)
      @str = str
    end

    def perform
      remove_whitespace!

      return false unless valid_length?
      return false if contains_non_digits?

      checksum_divisible_by_ten?
    end

    private

    def remove_whitespace!
      str.gsub!(/\s/, "")
    end

    def valid_length?
      str.length > 1
    end

    def contains_non_digits?
      str.scan(/\D/).any?
    end

    def digits
      str.each_char.map(&:to_i)
    end

    def checksum
      digits.reverse.each_with_index.inject(0) do |total, (digit, idx)|
        if idx.odd?
          digit *= 2
          digit -= 9 if digit > 9
        end
        total + digit
      end
    end

    def checksum_divisible_by_ten?
      checksum % 10 == 0
    end
  end
end

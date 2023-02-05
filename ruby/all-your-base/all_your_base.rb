=begin
Write your code for the 'All Your Base' exercise in this file. Make the tests in
`all_your_base_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/all-your-base` directory.
=end

class BaseConverter
  class << self
    def convert(input_base, digits, output_base)
      raise ArgumentError unless base_is_valid?(input_base)
      raise ArgumentError unless base_is_valid?(output_base)
      raise ArgumentError unless digits_are_valid?(digits, input_base)

      value = convert_from_base(input_base, digits)
      convert_to_base(output_base, value)
    end

    private

    def base_is_valid?(base)
      base > 1
    end

    def digits_are_valid?(digits, input_base)
      digits.all? { |digit| digit >= 0 && digit < input_base }
    end

    def convert_from_base(input_base, digits)
      digits.reverse.each_with_index.sum { |digit, idx| digit * (input_base ** idx) }
    end

    def convert_to_base(output_base, value)
      quotient = value
      result = []

      loop do 
        quotient, remainder = quotient.divmod(output_base)
        result << remainder
        break if quotient == 0
      end

      result.reverse
    end
  end
end

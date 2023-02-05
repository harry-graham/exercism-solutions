=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end

class Isogram
  class << self
    def isogram?(input)
      return true if input == ""

      character_counts(input).values.max <= 1
    end

    private

    def character_counts(text)
      text.downcase
        .gsub(/(\s|-)/, "")
        .split("")
        .inject(Hash.new(0)) { |h, letter| h[letter] += 1; h }
    end
  end
end

=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.select { |candidate| is_anagram?(candidate) }
  end

  private def is_anagram?(candidate)
    word_1 = word.downcase
    word_2 = candidate.downcase

    return false if word_1 == word_2
    word_1.split('').sort == word_2.split('').sort
  end
end

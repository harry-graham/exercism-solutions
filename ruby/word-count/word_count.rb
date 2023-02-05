=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end

class Phrase
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def word_count
    words.inject({}) { |h, word| h[word] ||= 0; h[word] += 1; h }
  end

  private

  def words
    text.downcase.scan(matching_regex_pattern).flatten
  end

  def matching_regex_pattern
    /(\d+|[a-z](?:(?:[a-z]|')*[a-z])?)/
  end
end

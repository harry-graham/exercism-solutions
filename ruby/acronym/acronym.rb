=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end

class Acronym
  class << self
    def abbreviate(text)
      words(text).map { |word| word[0] }.join.upcase
    end
  
    private def words(text)
      text.gsub(/[^a-z]/i, " ").split(" ")
    end
  end
end

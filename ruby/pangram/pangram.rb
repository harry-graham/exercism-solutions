=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end

class Pangram
  ALPHABET = ("a".."z").to_a

  class << self
    def pangram?(sentence)
      ALPHABET == letters_used_in(sentence)
    end
  
    private
  
    def letters_used_in(sentence)
      letters_only(sentence).downcase.split("").sort.uniq
    end

    def letters_only(sentence)
      sentence.gsub(/[^a-z]/i, "")
    end
  end
end

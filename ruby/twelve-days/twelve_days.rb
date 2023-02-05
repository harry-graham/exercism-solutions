class TwelveDays
  DAYS = %w[
    first second third fourth fifth sixth
    seventh eighth ninth tenth eleventh twelfth
  ]
  PRESENTS = [
    "a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming"
  ]

  class << self
    def song
      result = []
      12.times { |idx| result << lyric(idx) }
      result.join("\n")
    end

    private

    def lyric(idx)
      "#{lyric_start(idx)}: #{lyric_end(idx)}.\n"
    end

    def lyric_start(idx)
      "On the #{DAYS[idx]} day of Christmas my true love gave to me"
    end

    def lyric_end(idx)
      presents = []

      loop do
        presents << PRESENTS[idx]
        idx -= 1
        break if idx < 0
      end

      presents.to_sentence
    end
  end
end

# From https://codereview.stackexchange.com/a/5890 to mimic Rails #to_sentence
class Array
  def to_sentence(options = {})
    words_connector = options[:words_connector] || ", "
    two_words_connector = options[:two_words_connector] || ", and "
    last_word_connector = options[:last_word_connector] || ", and "

    case length
      when 0
        ""
      when 1
        self[0].to_s.dup
      when 2
        "#{self[0]}#{two_words_connector}#{self[1]}"
      else
        "#{self[0...-1].join(words_connector)}#{last_word_connector}#{self[-1]}"
    end
  end
end

# Refactored based on community solution:
# https://exercism.org/tracks/ruby/exercises/run-length-encoding/solutions/sterlzbd
class RunLengthEncoding
  class << self
    def encode(msg)
      msg.gsub(/(.)\1+/) { |str| str.length.to_s + str[0] }
    end

    def decode(msg)
      msg.gsub(/(\d+.)/) { |str| str[-1] * str[0..-2].to_i }
    end
  end
end

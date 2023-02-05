class Hamming
  class << self
    def compute(string_1, string_2)
      validate_inputs(string_1, string_2)
      hamming_distance_of(string_1, string_2)
    end

    private

    def validate_inputs(string_1, string_2)
      raise ArgumentError unless string_1.length == string_2.length
    end

    def hamming_distance_of(string_1, string_2)
      (0...(string_1.length)).count { |i| string_1[i] != string_2[i] }
    end
  end
end

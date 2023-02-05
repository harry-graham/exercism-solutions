class Complement
  DNA_TO_RNA = {"A" => "U", "C" => "G", "G" => "C", "T" => "A"}.freeze

  class << self
    def of_dna(dna)
      dna.chars.map { |n| DNA_TO_RNA[n] }.join
    end
  end
end

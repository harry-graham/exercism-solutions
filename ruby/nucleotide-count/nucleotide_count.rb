class Nucleotide
  class << self
    def from_dna(sequence)
      NucleotideHistogram.new(sequence)
    end
  end
end

class NucleotideHistogram
  attr_reader :histogram

  VALID_NUCLEOTIDES = %w[A C G T].freeze

  def initialize(sequence)
    validate_input(sequence)
    @histogram = to_histogram(sequence)
  end

  def count(letter)
    histogram[letter]
  end

  private

  def validate_input(sequence)
    raise ArgumentError unless sequence.delete(VALID_NUCLEOTIDES.join).empty?
  end

  def to_histogram(sequence)
    sequence.chars.inject(base_histogram) do |counts, letter|
      counts[letter] += 1
      counts
    end
  end

  def base_histogram
    VALID_NUCLEOTIDES.inject({}) do |hash, letter|
      hash[letter] = 0
      hash
    end
  end
end

class InvalidCodonError < StandardError
end

class Translation
  CODON_TO_PROTEIN_MAPPING = {
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  class << self
    def of_codon(codon)
      CODON_TO_PROTEIN_MAPPING[codon]
    end

    def of_rna(strand)
      codons = codons_from(strand)

      proteins = []
      codons.each do |codon|
        validate_codon(codon)
        protein = of_codon(codon)
        break if protein == "STOP"
        proteins << protein
      end

      proteins
    end

    def codons_from(strand)
      strand.chars.each_slice(3).map(&:join)
    end

    def validate_codon(codon)
      raise InvalidCodonError unless is_valid?(codon)
    end

    def is_valid?(codon)
      CODON_TO_PROTEIN_MAPPING.keys.include?(codon)
    end
  end
end

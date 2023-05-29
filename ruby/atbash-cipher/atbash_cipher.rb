class Atbash
  MAPPING = [*'a'..'z']

  class << self
    def encode(text)
      text
        .downcase
        .gsub(/[^a-z0-9]/, '')
        .split('')
        .map { |char| key_of(char) }
        .each_slice(5)
        .map { |a| a.join('') }
        .join(' ')
    end

    def decode(text)
      text
        .gsub(/[^a-z0-9]/, '')
        .split('')
        .map { |char| key_of(char) }
        .join('')
    end

    def key_of(char)
      return char if /[0-9]/.match?(char)
      return '' unless MAPPING.include?(char)

      MAPPING[MAPPING.length - 1 - MAPPING.index(char)]
    end
  end
end

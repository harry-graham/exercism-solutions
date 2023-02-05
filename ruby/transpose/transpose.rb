class Transpose
  class << self
    def transpose(input)
      rows = input.split("\n")
      rows
        .map { |row| row.ljust(max_row_length(rows), "_").chars }
        .transpose
        .map { |row| row.join.gsub(/_+$/, "").gsub(/_/, " ") }
        .join("\n")
    end

    private

    def max_row_length(arr)
      arr.map(&:length).max
    end
  end
end

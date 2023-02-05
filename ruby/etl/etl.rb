class ETL
  class << self
    def transform(data_hash)
      data_hash.inject({}) do |result, (points, letters)|
        letters.each do |letter|
          result[letter.downcase] = points
        end
        result
      end
    end
  end
end

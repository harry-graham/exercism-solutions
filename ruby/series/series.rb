class Series
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def slices(slice_length)
    raise ArgumentError unless valid_slice_length?(slice_length)

    result = []
    slice_indices(slice_length).each do |i|
      result << str[i, slice_length]
    end
    result
  end

  private

  def valid_slice_length?(slice_length)
    slice_length > 0 && slice_length <= str.length
  end

  def slice_indices(slice_length)
    0..(str.length - slice_length)
  end
end

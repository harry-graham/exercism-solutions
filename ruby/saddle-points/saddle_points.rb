class Matrix
  attr_reader :rows, :columns

  def initialize(input)
    @rows = input.each_line.map { |row| row.split.map(&:to_i) }
    @columns = rows.transpose
  end

  def saddle_points
    result = []
    rows.each_with_index do |row, i|
      columns.each_with_index do |column, j|
        result << [i, j] if is_a_saddle_point?(row, column, row[j])
      end
    end
    result
  end

  private

  def is_a_saddle_point?(row, column, val)
    val == column.min && val == row.max
  end
end

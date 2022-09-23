module Conversion
  def square_to_coord(square)
    columns = %w[a b c d e f g h]
    column = square[0]
    row = square[1].to_i
    row_index = row - 1
    column_index = columns.index(column)

    [row_index, column_index]
  end

  def coord_to_square(coord)
    columns = %w[a b c d e f g h]
    row_index = coord[0]
    column_index = coord[1]
    row = row_index + 1
    column = columns[column_index]

    "#{column}#{row}"
  end
end
# frozen_string_literal: false

# Converts square ('a1') to coordinates ([0, 0]) and vice-versa
module Conversion
  def square_to_coord(square)
    columns = %w[a b c d e f g h]
    column = square[0]
    row = square[1].to_i
    row_index = row - 1
    column_index = columns.index(column)

    [column_index, row_index]
  end

  def coord_to_square(coord)
    columns = %w[a b c d e f g h]
    column_index = coord[0]
    column = columns[column_index]
    row_index = coord[1]
    row = row_index + 1

    "#{column}#{row}"
  end
end

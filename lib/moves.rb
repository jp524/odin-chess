# frozen_string_literal: false

# Generates the available moves on the board for a chess piece
class Moves
  def initialize
    @columns = %w[a b c d e f g h]
  end

  def king(start)
    # start will be a valid square, such as 'a3'
    coord = square_to_coord(start)
    y, x = coord
    moves = [[y + 1, x - 1],
             [y + 1, x],
             [y + 1, x + 1],
             [y, x - 1],
             [y, x + 1],
             [y - 1, x - 1],
             [y - 1, x],
             [y - 1, x + 1]]
    filter_sort_moves(moves)
    moves.map { |move| coord_to_square(move) }
  end

  def rook(start)
    coord = square_to_coord(start)
    y, x = coord
    moves = []
    # Removing ability to leap over other pieces to be implemented later

    (0..7).each do |i|
      moves << [y, i]
      moves << [i, x]
    end

    moves.reject! { |move| move == coord }
    moves.sort_by! { |move| move }
    moves.map { |move| coord_to_square(move) }
  end

  def bishop(start)
    coord = square_to_coord(start)
    y, x = coord
    moves = []
    # Removing ability to leap over other pieces to be implemented later
    (0..7).each do |i|
      moves << [y - i, x - i]
      moves << [y + i, x + i]
      moves << [y - i, x + i]
      moves << [y + i, x - i]
    end
    moves.reject! { |move| move == coord }
    filter_sort_moves(moves)
    moves.map { |move| coord_to_square(move) }
  end

  def queen(start)
    # Removing ability to leap over other pieces to be implemented later
    rook(start) + bishop(start)
  end

  def knight(start)
    coord = square_to_coord(start)
    y, x = coord

    moves = [[y + 2, x - 1],
             [y - 2, x - 1],
             [y + 2, x + 1],
             [y - 2, x + 1],
             [y + 1, x - 2],
             [y - 1, x - 2],
             [y + 1, x + 2],
             [y - 1, x + 2]]
    filter_sort_moves(moves)
    moves.map { |move| coord_to_square(move) }
  end

  def filter_sort_moves(moves)
    moves.filter! { |move| (0..7).include?(move[0]) && (0..7).include?(move[1]) }
    moves.sort_by! { |move| move }
    moves
  end

  def square_to_coord(square)
    column = square[0]
    row = square[1].to_i
    row_index = row - 1
    column_index = @columns.index(column)

    [row_index, column_index]
  end

  def coord_to_square(coord)
    row_index = coord[0]
    column_index = coord[1]
    row = row_index + 1
    column = @columns[column_index]

    "#{column}#{row}"
  end
end

# moves = Moves.new
# p moves.bishop('d4')

# frozen_string_literal: false

require_relative '../lib/conversion'

# Generates the available moves on the board for a chess piece
class Moves
  include Conversion

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
    # To be implemented: checking if empty square for the first jump
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

  def pawn(start, color)
    if start[1] == '2' && color == 'W'
      pawn_double(start)
    elsif start[1] == '7' && color == 'B'
      pawn_double(start)
    else
      pawn_single(start)
    end
  end

  def pawn_double(start)
    coord = square_to_coord(start)
    y, x = coord
    moves = [[y + 1, x], [y + 2, x]]
    filter_sort_moves(moves)
    moves.map { |move| coord_to_square(move) }
  end

  def pawn_single(start)
    coord = square_to_coord(start)
    y, x = coord
    moves = [[y + 1, x]]
    filter_sort_moves(moves)
    moves.map { |move| coord_to_square(move) }
  end

  def filter_sort_moves(moves)
    moves.filter! { |move| (0..7).include?(move[0]) && (0..7).include?(move[1]) }
    moves.sort_by! { |move| move }
    moves
  end
end

moves = Moves.new
p moves.rook('c3')

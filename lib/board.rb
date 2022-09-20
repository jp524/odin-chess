# frozen_string_literal: false

# Contains the 8x8 chess board
class Board
  def initialize
    @board = Array.new(8) { Array.new(8) { ' ' } }
  end

  def display
    puts "     #{%w[a b c d e f g h].join('   ')}"
    puts "   #{'-' * 32}"
    @board.each_with_index.reverse_each do |row, i|
      puts " #{i + 1} | #{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} | #{row[4]} | #{row[5]} | #{row[6]} | #{row[7]} | #{i + 1}"
      puts "   #{'-' * 32}"
    end
    puts "     #{%w[a b c d e f g h].join('   ')}"
  end

  def place_pieces(positions, color)
    columns = %w[a b c d e f g h]
    positions.each_pair do |piece, square|
      column = square[0]
      row = square[1].to_i
      row_index = row - 1
      column_index = columns.index(column)
      piece_symbol = convert_to_unicode(piece.to_s[0], color)
      @board[row_index][column_index] = piece_symbol
    end
  end

  def convert_to_unicode(piece, color)
    symbols_w = { 'R' => '♖',
                  'N' => '♘',
                  'B' => '♗',
                  'Q' => '♕',
                  'K' => '♔',
                  'P' => '♙' }
    symbols_b = { 'R' => '♜',
                  'N' => '♞',
                  'B' => '♝',
                  'Q' => '♛',
                  'K' => '♚',
                  'P' => '♟' }
    case color
    when 'W'
      symbols_w[piece]
    when 'B'
      symbols_b[piece]
    end
  end
end

# board = Board.new
# board.display

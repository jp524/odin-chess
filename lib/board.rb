# frozen_string_literal: false

require_relative './conversion'

# Contains the 8x8 chess board
class Board
  include Conversion

  def initialize
    @board = Array.new(8) { Array.new(8) { ' ' } }
    @symbols_w = { 'R' => '♖',
                   'N' => '♘',
                   'B' => '♗',
                   'Q' => '♕',
                   'K' => '♔',
                   'P' => '♙' }
    @symbols_b = { 'R' => '♜',
                   'N' => '♞',
                   'B' => '♝',
                   'Q' => '♛',
                   'K' => '♚',
                   'P' => '♟' }
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

  def send_to_board(player_w, player_b)
    place_pieces(player_w.positions, player_w.color)
    place_pieces(player_b.positions, player_b.color)
  end

  def place_pieces(positions, color)
    positions.each_pair do |piece, square|
      piece_symbol = convert_to_unicode(piece.to_s[0], color)
      row_index, column_index = square_to_coord(square)
      @board[row_index][column_index] = piece_symbol
    end
  end

  def convert_to_unicode(piece, color)
    case color
    when 'W'
      @symbols_w[piece]
    when 'B'
      @symbols_b[piece]
    end
  end
end

# board = Board.new
# board.display

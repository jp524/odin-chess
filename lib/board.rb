# frozen_string_literal: false

require_relative './piece'
require_relative './conversion'

# Contains the 8x8 chess board
class Board
  include Conversion

  def initialize
    @symbols_w = { 'R' => '♖', 'N' => '♘', 'B' => '♗', 'Q' => '♕', 'K' => '♔', 'P' => '♙' }
    @symbols_b = { 'R' => '♜', 'N' => '♞', 'B' => '♝', 'Q' => '♛', 'K' => '♚', 'P' => '♟' }
    @board = []
    create_empty_board
    set_initial_pieces
    set_pieces_color
    set_pieces_symbol
  end

  def create_empty_board
    rows = (1..8).to_a
    columns = %w[a b c d e f g h]
    rows.each do |row|
      columns.each do |column|
        @board << Piece.new("#{column}#{row}")
      end
    end
  end

  def set_initial_pieces
    @board.map do |piece|
      case piece.square
      when 'a1', 'h1', 'a8', 'h8'
        piece.name = 'R'
      when 'b1', 'g1', 'b8', 'g8'
        piece.name = 'N'
      when 'c1', 'f1', 'c8', 'f8'
        piece.name = 'B'
      when 'd1', 'd8'
        piece.name = 'Q'
      when 'e1', 'e8'
        piece.name = 'K'
      when 'a2', 'b2', 'c2', 'd2', 'e2', 'f2', 'g2', 'h2', 'a7', 'b7', 'c7', 'd7', 'e7', 'f7', 'g7', 'h7'
        piece.name = 'P'
      end
    end
  end

  def set_pieces_color
    @board[0..15].each { |piece| piece.color = 'W' }
    @board[48..63].each { |piece| piece.color = 'B' }
  end

  def print_rows
    rows = @board.each_slice(8)
    rows.each_with_index.reverse_each do |r, i|
      print " #{i + 1} | #{r[0].symbol} | #{r[1].symbol} | #{r[2].symbol} | "
      print "#{r[3].symbol} | #{r[4].symbol} | #{r[5].symbol} | #{r[6].symbol} | #{r[7].symbol} | #{i + 1}\n"
      puts "   #{'-' * 32}"
    end
  end

  def display
    column_legend = "     #{%w[a b c d e f g h].join('   ')}"
    puts column_legend
    puts "   #{'-' * 32}"
    print_rows
    puts column_legend
  end

  def set_pieces_symbol
    @board.map do |piece|
      case piece.color
      when 'W'
        piece.symbol = @symbols_w[piece.name]
      when 'B'
        piece.symbol = @symbols_b[piece.name]
      end
    end
  end

  def piece_exists?(name, square)
    @board.each do |piece|
      return true if piece.piece_exists?(name, square)
    end
    false
  end
end

board = Board.new
board.display

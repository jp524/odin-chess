# frozen_string_literal: false

# Contains the 8x8 chess board
class Board
  def initialize
    @board = []
    create_board
  end

  def create_board
    columns = %w[a b c d e f g h]
    rows = (1..8).to_a
    columns.each do |column|
      rows.each do |row|
        @board << "#{column}#{row}"
      end
    end
  end
end

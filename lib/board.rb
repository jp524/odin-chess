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
    rows.each do |row|
      columns.each do |column|
        @board << "#{column}#{row}"
      end
    end
  end

  def display
    puts(@board.each_slice(8).reverse_each.map do |row|
      row.join(' | ')
    end.join("\n#{'-' * 37}\n"))
  end
end

# board = Board.new
# board.display

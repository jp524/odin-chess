# frozen_string_literal: false

# Contains the 8x8 chess board
class Board
  def initialize
    # @board = []
    # create_board
    @board = Array.new(8) { Array.new(8) { ' ' } }
  end

  # def create_board
    # columns = %w[a b c d e f g h]
    # rows = (1..8).to_a
    # rows.each do |row|
    #   columns.each do |column|
    #     @board << "#{column}#{row}"
    #   end
    # end
  # end

  # def display(player_w, player_b)
  #   board_copy = @board.map do |square|
  #     if player_w.values.include?(square)
  #       'W'
  #     elsif player_b.values.include?(square)
  #       'B'
  #     else
  #       ' '
  #     end
  #   end

  #   puts(board_copy.each_slice(8).reverse_each.map do |row|
  #     "i   #{row.join(' | ')}"
  #   end.join("\n   #{'-' * 31}\n"))
  #   puts "\n"
  #   puts '    a   b   c   d   e   f   g   h'
  # end

  def display
    puts "     #{%w[a b c d e f g h].join('   ')}"
    puts '   ---------------------------------'
    @board.each_with_index.reverse_each do |row, i|
      puts " #{i + 1} | #{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} | #{row[4]} | #{row[5]} | #{row[6]} | #{row[7]} | #{i + 1}"
      puts '   ---------------------------------'
    end
    puts "     #{%w[a b c d e f g h].join('   ')}"
  end
end

board = Board.new
board.display

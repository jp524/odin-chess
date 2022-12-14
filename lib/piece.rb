# frozen_string_literal: false

# Information for each piece contained in the Board
class Piece
  attr_accessor :name, :symbol, :color

  attr_reader :square

  def initialize(square)
    @name = nil
    @symbol = ' '
    @square = square
    @color = nil
  end

  def piece_exists?(name, square)
    return true if @name == name && @square == square

    false
  end
end

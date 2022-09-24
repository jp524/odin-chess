# frozen_string_literal: false

require_relative './board'

# Contains instances of Board and Player to run the game
class Game
  def initialize
    @board = Board.new
  end

  def display
    @board.display
  end
end

game = Game.new
game.display

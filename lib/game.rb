# frozen_string_literal: false

require_relative './board'
require_relative './player'

# Contains instances of Board and Player to run the game
class Game
  def initialize
    @board = Board.new
    @player_w = Player.new('W')
    @player_b = Player.new('B')
  end

  def display
    @board.display(@player_w.positions, @player_b.positions)
  end
end

game = Game.new
game.display

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
    @board.place_pieces(@player_w.positions, @player_w.color)
    @board.place_pieces(@player_b.positions, @player_b.color)
    @board.display
  end
end

game = Game.new
game.display

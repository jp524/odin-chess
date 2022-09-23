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
    @board.send_to_board(@player_w, @player_b)
    @board.display
  end
end

game = Game.new
game.display

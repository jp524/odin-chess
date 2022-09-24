# frozen_string_literal: false

require_relative './board'

# Contains instances of Board and Player to run the game
class Game
  def initialize
    @board = Board.new
    @player_list = { active: 'W', inactive: 'B' }
  end

  def display
    @board.display
  end

  # Check if piece is start square exists
  # Other method will check if finish square is valid
  def valid_start_input?(input)
    piece, start, finish = input.split(' ')
    @board.piece_exists?(piece, start)
  end

  private

  def player_input
    puts "#{@player_list[:active]}: Enter a move, such as 'P a2 a4':"
    gets.chomp
  end
end

game = Game.new
game.display

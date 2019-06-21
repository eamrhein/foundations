# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# battleship game env
class Battleship
  attr_reader :board, :player
  def initialize(dim)
    @player = Player.new
    @board = Board.new(dim)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    puts @board.num_ships.to_s + ' ships place on the board.'
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts 'you lose'
      true
    else
      false
    end
  end

  def win?
    if @board.num_ships.zero?
      puts 'you win'
      true
    else
      false
    end
  end

  def game_over?
    win? || lose?
  end

  def turn
    move = @player.get_move
    @remaining_misses -= 1 unless @board.attack(move)
    @board.print
    puts @remaining_misses
  end
end

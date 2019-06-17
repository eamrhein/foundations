# frozen_string_literal: true

# creates a guessing game object which attempts to guess a number
class GuessingGame
  attr_reader :num_attempts
  def initialize(min, max)
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
  end

  def game_over?
    @game_over
  end

  def check_num(num)
    @num_attempts += 1
    if num == @secret_num
      @game_over = true
      puts 'you win'
    end
    num > @secret_num ? puts('too big') : puts('too small')
  end

  def ask_user
    puts 'enter a number'
    input = gets.chomp.to_i
    check_num(input)
  end
end

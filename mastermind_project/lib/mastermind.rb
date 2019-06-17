# frozen_string_literal: true

require_relative 'code'

# Mastermine Game Environment
class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    puts @secret_code.num_exact_matches(code).to_s + " exact matches."
    puts @secret_code.num_near_matches(code).to_s + " near matches."
  end

  def ask_user_for_guess
    puts 'Enter a code '
    guess_str = gets.chomp
    guess = Code.from_string(guess_str)
    print_matches(guess)
    guess == @secret_code
  end
end

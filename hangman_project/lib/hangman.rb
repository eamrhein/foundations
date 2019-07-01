# frozen_string_literal: true

# Hangman Game Engine
class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = %w['cat dog bootcamp pizza']
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |ch, i| indices << i if ch == char }
    indices
  end

  def fill_indices(char, arr)
    arr.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      puts 'that has already been attempted'
      false
    else
      @attempted_chars << char
      matching = get_matching_indices(char)
      fill_indices(char, matching)
      @remaining_incorrect_guesses -= 1 if matching == []
      true
    end
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    try_guess(gets.chomp)
  end

  def win?
    return false if guess_word.join != @secret_word

    puts 'WIN'
    true
  end

  def lose?
    if @remaining_incorrect_guesses.zero?
      puts 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    end
    false
  end
end

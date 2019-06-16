class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end
  def guess_word
    @guess_word
  end
  def attempted_chars
    @attempted_chars
  end
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end
  def already_attempted?(char)
    @attempted_chars.include?(char)
  end
  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |ch, i|
      if ch == char 
        indices << i
      end
    end
    indices
  end
  def fill_indices(char, arr)
    arr.each do |i|
      @guess_word[i]=char
    end
  end
  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << char
      matching = self.get_matching_indices(char)
      self.fill_indices(char, matching)
      if matching == []
        @remaining_incorrect_guesses -=1
      end
      return true
    end
  end
  def ask_user_for_guess
    puts "Enter a char:"
    self.try_guess(gets.chomp)
  end
  def win?
    if self.guess_word.join != @secret_word
      return false
    end
    puts 'WIN'
    return true
  end
  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    end
    false
  end
  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end
    false
  end
end

# frozen_string_literal: true

# rules for mastermind game
class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    'R' => :red,
    'G' => :green,
    'B' => :blue,
    'Y' => :yellow
  }.freeze

  def self.valid_pegs?(chars)
    chars.all? { |chr| POSSIBLE_PEGS.key?(chr.upcase) }
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(str)
    Code.new(str.split(//))
  end

  def initialize(chars)
    upcase = chars.map(&:upcase)
    Code.valid_pegs?(chars) ? @pegs = upcase : raise('Pegs are not valid')
  end

  def [](index)
    pegs[index]
  end

  def length
    pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      count += 1 if guess.pegs[i] == pegs[i]
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      count += 1 if guess[i] != self[i] && pegs.include?(guess[i])
    end
    count
  end

  def ==(other)
    other.pegs == pegs
  end
end

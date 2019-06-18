# frozen_string_literal: true

# Sets up a board for a battleship game
class Board
  attr_reader :size
  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(' ')
    end
  end

  def initialize(dim)
    @grid = Array.new(dim) { Array.new(dim) }
    @grid.each { |sub| sub.map! { :N } }
    @size = dim * dim
  end

  def [](position)
    @grid[position[0]][position[1]]
  end

  def []=(position, val)
    @grid[position[0]][position[1]] = val
  end

  def num_ships
    count = 0
    @grid.each do |sub|
      sub.each { |el| count += 1 if el == :S }
    end
    count
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts 'you sunk my battleship!'
      true
    else
      self[position] = :X
      false
    end
  end

  def place_random_ships
    ships = @size * 0.25
    while num_ships < ships
      rand_row = rand(0...@grid.length)
      rand_col = rand(0...@grid.length)
      pos = [rand_row, rand_col]
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map { |el| el == :S ? :N : el }
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end

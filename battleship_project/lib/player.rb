# frozen_string_literal: true

# class gives instructions to the player
class Player
  def get_move
    puts "enter a position with coordinates separated with a space like '4 7'"
    arr = gets.chomp("' '")
    arr.split.map(&:to_i)
  end
end

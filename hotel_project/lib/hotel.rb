require_relative "room"

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = {}
    hash.each do |key, value|
      @rooms[key] = Room.new(value)
    end
  end
  def name
    result = @name.split
    result.each do |word|
      word.capitalize!
    end
    result.join(" ")
  end
  def rooms
    @rooms
  end
  def room_exists?(name)
    if @rooms.has_key?(name)
      return true
    end
    return false
  end
  def check_in(name,roomname)
    if self.room_exists?(roomname)
      self.rooms[roomname].add_occupant(name)
      puts "check in successful"
    end
      puts "sorry, room does not exist"
  end
  def has_vacancy?
    !@rooms.values.all?{|room| room.full?}
  end
  def list_rooms
    @rooms.each do |name, room|
      puts "#{name} : #{room.available_space}"
    end

  end
end

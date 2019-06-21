# frozen_string_literal: true

# Managers data for individual plane flights
class Flight
  attr_reader :passengers
  def initialize(flight_num, capacity)
    @flight_number = flight_num
    @capacity = capacity
    @passengers = []
  end

  def full?
    @capacity == @passengers.length
  end

  def board_passenger(passenger)
    return if full?

    @passengers << passenger if passenger.has_flight?(@flight_number)
  end

  def list_passengers
    pass_list = []
    @passengers.each { |p| pass_list << p.name }
    pass_list
  end

  def [](index)
    @passengers[index]
  end

  def <<(passenger)
    board_passenger(passenger)
  end
end

# frozen_string_literal: true

# Passenger class managers passenger flight info
class Passenger
  attr_reader :name

  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  def has_flight?(str)
    @flight_numbers.include?(str.upcase)
  end

  def add_flight(str)
    @flight_numbers << str.upcase unless has_flight?(str)
  end
end
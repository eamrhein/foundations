# frozen_string_literal: true

# creates Employees to be used as part of the startup class
class Employee
  attr_reader :name, :title
  def initialize(name, title)
    @name = name
    @title = title
    @earnings = 0
  end

  def pay(amt)
    @earnings += amt
  end
end

# frozen_string_literal: true

require 'employee'

# Creates startup ojbects which model startups and does HR/Financial
# Calculations
class Startup
  attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(str)
    @salaries.key?(str)
  end

  def >(other)
    funding > other.funding
  end

  def hire(employee_name, title)
    raise 'This is not a valid title' unless valid_title?(title)

    @employees << Employee.new(employee_name, title)
  end

  def size
    @employees.length
  end

  def pay_employee(emp)
    error = 'Not enough funds to pay employees'
    raise error unless @funding >= @salaries[emp.title]

    @funding -= @salaries[emp.title]
    emp.pay(@salaries[emp.title])
  end

  def payday
    @employees.each do |emp|
      pay_employee(emp)
    end
  end

  def average_salary
    results = []
    employees.each do |emp|
      results << @salaries[emp.title]
    end
    results.sum.to_f / results.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    startup.salaries.each do |key, value|
      @salaries[key] = value if @salaries[key].nil?
    end
    startup.employees.each do |emp|
      @employees << emp
    end
    startup.close
  end
end

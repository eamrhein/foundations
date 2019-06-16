require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end
  def valid_title?(str)
    @salaries.has_key?(str)
  end
  def >(startup)
    if self.funding > startup.funding
      return true
    end
    return false
  end
  def hire(employee_name, title)
    if !self.valid_title?(title)
     raise "This is not a valid title"
    else
      @employees << Employee.new(employee_name, title)
    end
  end
  def size
    @employees.length
  end
  def pay_employee(emp)
    if @funding >=  @salaries[emp.title]
      @funding -= @salaries[emp.title]
      emp.pay(@salaries[emp.title])
    else
      raise "Not enough funds to pay employees"
    end
  end
  def payday
    @employees.each do |emp|
      self.pay_employee(emp)
    end
  end
  def average_salary
    results =[]
    employees.each do |emp|
      results <<  @salaries[emp.title]
    end
    results.sum.to_f/results.length
  end
  def close
    @employees = []
    @funding = 0
  end
  def acquire(startup)
    @funding = @funding + startup.funding
    startup.salaries.each do |key, value|
      if @salaries[key]==nil
         @salaries[key]=value
      end
    end
    startup.employees.each do |emp|
      @employees << emp
    end
    startup.close 
  end
end

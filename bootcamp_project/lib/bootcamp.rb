# frozen_string_literal: true

# bootcamp class
class Bootcamp
  atrr_reader :name, :slogan, :teachers, :students
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @students = []
    @teachers = []
    @grades = Hash.new {|hash,key| hash[key] = []}
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity
      @students << student
      return true
    else
      return false
    end
  end

  def enrolled?(student)
    @students.map(&:downcase).include?(student.downcase)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if self.enrolled?(student)
      @grades[student] << grade
      return true
    else
      return false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    if num_grades(student) == 0
      return nil
    end
    @grades[student].sum / num_grades(student)
  end
end

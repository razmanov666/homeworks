# frozen_string_literal: true

# It is abstract class, which help to projection class Mentor and class Student
class Human
  attr_reader :name, :surname
  def initialize(name, surname)
    @name = name
    @surname = surname
  end

  def to_s
    "#{name} #{surname}"
  end

  def fullname
    name + ' ' + surname
  end
end

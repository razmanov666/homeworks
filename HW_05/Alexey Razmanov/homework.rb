# frozen_string_literal: true

# It is class which create student's homeworks
class Homework
  attr_accessor :code
  attr_reader :pr_title, :student
  def initialize(code, pr_title, student)
    @code = code
    @pr_title = pr_title
    @student = student
  end

  def to_s
    "Code : #{code} , PR: #{pr_title}\nAuthor: #{student}"
  end
end

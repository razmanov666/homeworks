# set Homework class
class Homework
  attr_reader :hw_number, :hw_tasks

  def initialize(hw_number:, hw_tasks:)
    @hw_number = hw_number
    @hw_tasks = hw_tasks
  end
end

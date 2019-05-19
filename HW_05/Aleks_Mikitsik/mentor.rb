# set Mentor class
class Mentor < Human
  attr_accessor :notifications

  def initialize(name)
    @notifications = []
    super
  end

  def create_hw(homework_params)
    Homework.new(homework_params)
  end

  def subscribed_to!(student)
    student.mentor = self
  end

  def read_notifications!
    notifications.map { |note| note[:status] = 'read' }
  end

  def check!(homework, homework_solution)
    if homework_solution.solved_tasks.size == homework.hw_tasks.size
      homework_solution.status = 'succeeded'
    else
      homework_solution.status = 'failed'
    end
  end
end

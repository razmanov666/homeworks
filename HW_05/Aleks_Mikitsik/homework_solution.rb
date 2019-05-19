# set HomeworkSolution class
class HomeworkSolution
  attr_accessor :status
  attr_reader :student, :homework, :solved_tasks

  def initialize(student:, homework:, solved_tasks:)
    @student = student
    @homework = homework
    @solved_tasks = solved_tasks
  end
end

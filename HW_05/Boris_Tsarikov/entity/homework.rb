# Top level class describing a homework
class Homework
  attr_accessor :task, :pr_title, :task_solutions

  def initialize(task_solutions:, task:, pr_title:)
    @task_solutions = task_solutions
    @task = task
    @pr_title = pr_title
  end
end

# Heir to the class Human, describes the student and his work
class Student < Human
  attr_accessor :mentors, :homework, :repository

  def initialize(fullname:, id:, homework:, repository:)
    @homework = homework
    @repository = repository
    @mentors = []
    super(fullname: fullname, id: id)
  end

  def make_homework(solution)
    homework.task_solutions = solution
  end

  # Student publishes a solution on a remote repository
  # The mentor receives an alert
  def submit_homework(pr_title)
    hash = {
      "homework_source": homework.task_solutions.to_s,
      "student": fullname.to_s,
      "pr_title": pr_title.to_s
    }
    repository.push_solution(hash)
    notify_mentors
  end

  def add_mentor(mentor)
    @mentors << mentor
  end

  def notify_mentors
    mentors.each do |mentor|
      mentor.update_journal(self)
    end
  end

  def update_task(mentor)
    puts "Mentor #{mentor.fullname} has added a new task."
    homework.task = update_task_from_repository
  end

  # Take homework from a remote repository
  def update_task_from_repository
    repository.clone_project
  end

  def refactor(mentor)
    puts "Mentor #{mentor.fullname} sent your sulution for refac"
    refactoring_solution
  end

  def refactoring_solution
    puts "Student: #{fullname} corrected his homework"
    homework.task_solutions = 'Corrected homework'
    submit_homework('Homework after refactoring')
  end

  def view_mentor_list
    mentors.each { |mentor| print "Mentor: #{mentor.fullname}" }
  end
end

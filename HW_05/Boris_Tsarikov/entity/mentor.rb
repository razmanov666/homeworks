require 'json'
# Heir to the class Human, describes the mentor and his work
class Mentor < Human
  attr_accessor :students, :journal, :notifications, :repository

  def initialize(fullname:, id:, repository:, journal:)
    @journal = journal
    @repository = repository
    @students = []
    super(fullname: fullname, id: id)
  end

  def add_homework(name:, task_interpretation:, task:)
    hash = {
      task_name: name.to_s,
      task_for_students: task_interpretation.to_s
    }
    task.record_task(hash)
  end

  def publish_homework(task)
    task_info = task.read_task
    hash = {
      task_name: task_info['task_name'].to_s,
      task: task_info['task_for_students'].to_s
    }
    repository.push_homework(self, hash, task_info['task_for_students'])
    notify_students
  end

  def add_student(student)
    @students << student
    hash = {
      student.id => {
        'fullname' => student.fullname.to_s,
        'task_status' => 'false'
      }
    }
    journal.record_student_in_journal(hash)
  end

  def notify_students
    students.each do |student|
      student.update_task(self)
    end
  end

  # Task 1, Homework 3 method to check
  def check_homework(solution)
    solution.each_line do |line|
      return false if line.downcase.include?('error')
    end
    true
  end

  # Mentor checks notice
  def log_notice(student_name)
    info = "Student #{student_name} sent homework to check"
    puts info
    hash = {
      'notification' => info
    }
    journal.log_a_notice(hash)
  end

  def add_status_to_journal(student_name:, student_id:, status:)
    hash = {
      student_id.to_s => {
        'fullname' => student_name.to_s,
        'task_status' => status.to_s
      }
    }
    journal.record_task_status(hash)
  end

  # Mentor gets a notification that the student published a solution
  # Mentor check homework and gives the answer
  def update_journal(student)
    log_notice(student.fullname)
    if check_homework(student.homework.task_solutions)
      add_status_to_journal(student_name: student.fullname,
                            student_id: student.id, status: true)
      repository.merge(self)
    else
      add_status_to_journal(student_name: student.fullname,
                            student_id: student.id, status: false)
      student.refactor(self)
    end
  end

  def students_list
    students.each { |student| print "Student: #{student.fullname}" }
  end
end

require_relative '../entity/human'
require_relative '../entity/mentor'
require_relative '../entity/student'
require_relative '../entity/homeworkhub'
require_relative '../entity/homework'
require_relative '../entity/task'
require_relative '../entity/journal'

# Create a remote repository object
homework_hub = Homeworkhub.new(host: 'http://exampleHub.com/')

# Create a task object
task_for_students = Task.new(task_name: 'none', task: 'none')

# Create a journal object for mentors
mentors_journal = Journal.new(student_journal: 'resources/journal.json',
                              notifications: 'resources/notifications.json')

# Create a mentor object
first_mentor = Mentor.new(fullname: 'Alexander Shagov',
                          id: 1, repository: homework_hub,
                          journal: mentors_journal)

# Create a student homework object
student_homework = Homework
                   .new(task_solutions: 'none', task: 'none', pr_title: 'none')

# Create a student object
first_student = Student.new(
  fullname: 'Boris Tsarikov', id: 1,
  homework: student_homework, repository: homework_hub
)

# Mentor subscribes to student
first_mentor.add_student(first_student)

# Student subscribes to student
first_student.add_mentor(first_mentor)

# Mentor adds task (locally)
first_mentor.add_homework(name: 'HW_01',
                          task_interpretation: 'Find error',
                          task: task_for_students)

# Mentor publish homework on remote repository
# A student who is signed up for a mentor receives
# a notice about a posted homework.
# Then the student calls the repository cloning
# method to the local repository.
first_mentor.publish_homework(task_for_students)

# Student make homework
first_student.make_homework('Solution with error')

# Student pushes homework solution to remote repository
# A mentor signed up for a student is notified of a homework assignment.
# Mentor checks homework. If it is solved correctly,
# the mentor accepts a pull request and merge it.
# If the job is not decided correctly, it sends it to refactor
# After which the student refactor and send it again.
first_student
  .submit_homework("PR from #{first_student.fullname}")

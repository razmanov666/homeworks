require_relative 'human'
require_relative 'student'
require_relative 'mentor'
require_relative 'homework'

student = Student.new(fullname: 'John Doe')
mentor = Mentor.new(fullname: 'Deja Vu')

student.do_homework('p 123', 'HW 01')

mentor.subscribe_to_student(student)

student.submit_homework('HW 01')

mentor.check_homework(student, 'HW 01')

mentor.notifications
mentor.read_notifications!

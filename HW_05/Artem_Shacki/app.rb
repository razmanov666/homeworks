require_relative 'homework'
require_relative 'notification'
require_relative 'student'
require_relative 'mentor'

student = Student.new('Oleg')
mentor = Mentor.new('Lex')

mentor.subscribe_to(student)

student.new_homework('Homework 05', 'ruby')
student.submit_homework('Homework 05')
mentor.check_homeworks(student)

puts mentor.notifications
mentor.read_notifitacions!
puts mentor.notifications

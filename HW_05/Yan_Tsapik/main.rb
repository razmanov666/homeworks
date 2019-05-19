require_relative 'student'
require_relative 'mentor'
require_relative 'homework'
require_relative 'notification'

student = Student.new('jan')
student2 = Student.new('vasya')
mentor = Mentor.new('Maks')

mentor.subscribe_to_student(student)
mentor.subscribe_to_student(student2)

student2.create_homework('Homework 2', 'puts hw2')
student.create_homework('Homework 5', 'puts hw')

puts mentor.notifications
mentor.check_homeworks!
mentor.read_notifications!
puts mentor.notifications

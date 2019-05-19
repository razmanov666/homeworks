require_relative 'notification'
require_relative 'student'
require_relative 'mentor'
require_relative 'homework'
require 'awesome_print'

mentor1 = Mentor.new(name: 'Jack')
mentor2 = Mentor.new(name: 'John', id: 1)

student1 = Student.new(id: 2)
student2 = Student.new(name: 'Claus', id: 3)

mentor1.follow(student1)
mentor1.follow(student2)
mentor2.follow(student1)

student1.submit_homework(Homework.new)
student2.submit_homework(Homework.new)
student1.submit_homework(Homework.new(name: 'second homework'))

ap mentor1.notifications
ap mentor2.notifications

student1.homeworks.first.check_by(mentor1)
mentor1.read_notifications
ap mentor2.notifications
ap mentor1.notifications

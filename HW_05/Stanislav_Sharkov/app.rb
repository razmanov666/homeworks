require_relative 'student'
require_relative 'mentor'

sharkov = Student.new(name: 'Stanislav', surname: 'Sharkov')
# create Student Stanislav Sharkov.
shagov = Mentor.new(name: 'Alexandr', surname: 'Shagov')
# create Mentor Alexandr Shagov.
holubeu = Mentor.new(name: 'Maksim', surname: 'Holubeu')
# create Mentor Maksim Holubeu.
holubeu.subscribe_to_student(sharkov)
# Maksim subscribe to Stanislav.
sharkov.make_homework("puts 'Hello world!'", 'Homework 01')
sharkov.submit_homework('Homework 01')
# Stanislav made and submitted his homework.
shagov.pretty_notifications
# Empty because he didn't subscribe to Stanislav.
holubeu.pretty_notifications
# Maksim has one new notification.
holubeu.read_notifications!
# Now notification status => Read
shagov.check_homework(sharkov, 'Homework 01')
# Alexandr checks Stanislav homework.
sharkov.homeworks
# Now for homework with pr_title Homework 01 set the mark. In this case
# mark => 'Incorrect'
sharkov.make_homework('I have best mentors!', 'Homework 02')
sharkov.submit_homework('Homework 02')
holubeu.pretty_notifications
# Now Maksim has new notification with status => Unread
shagov.check_homework(sharkov, 'Homework 02')
# Now for homework with pr_title Homework 02 set the mark. In this case
# mark => 'Correct!'

require 'net/http'
require 'json'
require_relative 'human'
require_relative 'mentor'
require_relative 'student'
require_relative 'notification'
require_relative 'homework'

random_solution = rand(2) # random for generate source code and create 2 cases

# creation the new persons
mentor = Mentor.new('Ivan', 'Ivanov')
razmanov = Student.new('Alexey', 'Razmanov')
bogma = Student.new('Kirill', 'Bogma')

# Student do homework
homework_razmanov = razmanov.do_homework(random_solution.to_s, 'HW_05',
                                         razmanov.fullname)

# Mentor subscribe on student's updates
# Mentor can subscribed on many students with helps optional parameter
mentor.subscribe_to_student(razmanov.fullname, bogma.fullname)

# Student get information about his subs
razmanov.get_subs(mentor)

# Student submiting the homework
razmanov.submit_homework(homework_razmanov)

# Mentor check the homework
mentor.check_homework(homework_razmanov)

# Mentor get notification about submited homeworks
mentor.notification

# Mentor read all notification
mentor.read_notifications!

# Mentor see on all notification
mentor.show_all_notification

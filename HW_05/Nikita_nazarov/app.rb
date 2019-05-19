require_relative 'human'
require_relative 'student'
require_relative 'mentor'

# add student - Nikita Nazarov
student1 = Student.new('Nikita Nazarov')
# add student - Ivan Ivanov
student2 = Student.new('Ivan Ivanov')
# add mentor - Alexandr Shagov
mentor1 = Mentor.new('Alexandr Shagov')
# add mentor - Maksim Holubev
mentor2 = Mentor.new('Maksim Holubev')
# Alex subscribe to Nikita
mentor1.subscribe_to_student(student1)
mentor1.subscribe_to_student(student2)
# Nikita make homework
homework = student1.make_hw
# Nikita submit his homework
student1.submit_homework(homework: homework)
# Alex check homework from Nikita
mentor1.check_homework(homework: homework)
# Ivan make homework
homework = student2.make_hw
# Ivan submit his homework
student2.submit_homework(homework: homework)
# Maks gets notifications
# but he does not receive them because he is not subscribed to any student
mentor2.notifications
# Alex gets notifications
mentor1.notifications
# Alex read notifications and set stutus from unread to read
mentor1.read_notifications!
# Alex check homework from Ivan
mentor1.check_homework(homework: homework)
# Nikita make one more homework
homework = student1.make_hw
# Nikita submit his new homework
student1.submit_homework(homework: homework)
# Alex gets notifications
mentor1.notifications
# Alex read notifications
mentor1.read_notifications!
# Alex check this homework
mentor1.check_homework(homework: homework)

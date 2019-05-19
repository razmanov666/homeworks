require 'json'
require 'net/http'
require 'uri'
require_relative 'human'
require_relative 'mentor'
require_relative 'student'
require_relative 'homework'
require_relative 'homework_solution'

mentor_petrov = Mentor.new(first_name: 'Piotr', last_name: 'Petrov')
sudent_ivanov = Student.new(first_name: 'Ivan', last_name: 'Ivanov')

hw01 = mentor_petrov.create_hw(
  hw_number: 'hw_01',
  hw_tasks:
  { task_1_1: 'some task_1_1 contents', task_1_2: 'some task_1_2 contents',
    task_1_3: 'some task_1_3 contents', task_1_4: 'some task_1_4 contents' }
)

mentor_petrov.subscribed_to!(sudent_ivanov)

sudent_ivanov.takes_hw(hw01)

st_ivanov_hw_01_done = sudent_ivanov.complete_hw(
  solved_tasks:
  { task_1_1: 'answer_1_1', task_1_2: 'answer_1_2',
    task_1_3: 'answer_1_3', task_1_4: 'answer_1_4' }
)

sudent_ivanov.submit_hw

mentor_petrov.read_notifications!

mentor_petrov.check!(hw01, st_ivanov_hw_01_done)

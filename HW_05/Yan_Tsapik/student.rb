require 'net/http'
require 'json'

# discribes Student
class Student
  attr_reader :hws, :subscribers, :name

  def initialize(name)
    @name = name
    @hws = []
    @subscribers = []
  end

  def submit_homework(hmw)
    uri = URI('https://www.example.edu')
    Net::HTTP.post(uri, hmw.to_json)
  end

  def add_subscriber(mentor)
    @subscribers << mentor
  end

  def create_homework(name, content)
    hw = Homework.new(name, content, self)
    @hws << hw
    submit_homework(hw)
  end
end

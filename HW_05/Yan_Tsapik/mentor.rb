# discribes Mentor
class Mentor
  attr_accessor :notifications
  attr_reader :name, :subscriptions

  def initialize(name)
    @name = name
    @subscriptions = []
    @notifications = []
  end

  def check_homeworks!
    @notifications.each do |n|
      n.content.status = true
    end
  end

  def subscribe_to_student(student)
    @subscriptions << student
    student.add_subscriber(self)
  end

  def read_notifications!
    @notifications.each do |n|
      n.status = true
    end
  end
end

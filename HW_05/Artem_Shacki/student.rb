require 'net/http'
require 'uri'
require 'json'

# description for Student
class Student
  attr_reader :name
  attr_accessor :subscribers, :homeworks

  def initialize(name)
    @name = name
    @subscribers = []
    @homeworks = []
  end

  def new_subscriber(mentor)
    @subscribers << mentor
  end

  def new_homework(title, content)
    @homeworks << Homework.new(title, self, content)
  end

  def submit_homework(title)
    Net::HTTP.post URI('http://www.exemple.com/'),
                   pick_homework(title).to_json,
                   'Content-Type' => 'application/json'

    new_notification(title)
  end

  private

  def notes_content(title)
    @homeworks.each do |hw|
      return hw.title if hw.title.include?(title)
    end
  end

  def new_notification(title)
    @subscribers.each do |sub|
      sub.notification_list << Notification.new(self, sub, notes_content(title))
    end
  end

  def pick_homework(title)
    @homeworks.each do |hw|
      hw if hw.title.include?(title)
    end
  end
end

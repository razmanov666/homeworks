require 'net/http'
require_relative 'human'
require_relative 'notification'

# The guy who makes homeworks and notifies his subscribers
class Student < Human
  attr_reader :homeworks, :subscribers
  def initialize(name: 'John Doe', id: 0, homeworks: [], subscribers: [])
    super(name: name, id: id)
    @homeworks = homeworks
    @subscribers = subscribers
  end

  def add_follower(mentor)
    @subscribers << mentor
  end

  def submit_homework(homework)
    homework.create("puts 'hello world' # in ruby")
    puts send_request(homework)
    @homeworks << homework
    notification = Notification.new.from_student(self)
    notify(notification)
  end

  private

  def send_request(homework)
    uri = URI('http://www.example.com/')
    Net::HTTP.post_form(uri, request_json(homework)).inspect
  rescue SocketError
    nil
  end

  def request_json(homework)
    {
      homework_source: homework.source,
      student: "#{name} #{id}",
      pr_title: "#{name}'s#{homework.name}"
    }
  end

  def notify(notification)
    @subscribers.each { |sub| sub.update(notification) }
  end
end

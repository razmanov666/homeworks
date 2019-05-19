require_relative 'human'
require_relative 'notification'

# The one who reviews
class Mentor < Human
  attr_reader :notifications, :claim

  def initialize(name: 'John Doe', id: 0, notifications: [], claim: 'ruby')
    super(name: name, id: id)
    @notifications = notifications
    @claim = claim
  end

  def read_notifications
    @notifications.each(&:read) unless @notifications.empty?
  end

  def follow(user)
    user.add_follower(self)
  end

  def check_homework(homework)
    homework.check(self)
  end

  def update(notification)
    @notifications << notification
  end
end

require_relative 'human'
require_relative 'notification'
require_relative 'modules/check'
require_relative 'modules/message'
# Mentor class
class Mentor < Human
  include Check
  include Message
  attr_reader :subscriptions, :notifications

  def initialize(name:, surname:)
    @subscriptions = []
    @notifications = []
    super
  end

  def subscribe_to_student(student)
    unless Check::MentorCheck.student?(student)
      return Message::MentorMessage.not_a_student

    end
    unless Check::MentorCheck.uniq_student?(subscriptions, student)
      return Message::MentorMessage.not_uniq_student

    end

    date = Time.now.iso8601(6)
    subscriptions << { student: student, date: date }
    student.subscribers << { mentor: self, date: date }
    Message::MentorMessage.successful_subscription(student)
  end

  def check_homework(student, pr_title)
    mark_hw(select_homework(student, pr_title))
  end

  def pretty_notifications
    Message::MentorMessage.pretty_notification(notifications)
  end

  def read_notifications!
    notifications.each do |notif|
      notif.body[:status] = 'Read'
    end
  end

  private

  def select_homework(student, pr_title)
    student.homeworks.each do |hw|
      return hw if hw.body[:pr_title].eql?(pr_title)
    end

    'not found'
  end

  def mark_hw(hmw)
    return Message::MentorMessage.hw_does_not_exist if hmw == 'not found'

    hmw.body[:mark] = if hmw.body[:source_code] == 'I have best mentors!'
                        'Correct!'
                      else
                        'Incorrect!'
                      end
  end
end

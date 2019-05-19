require 'time'
require_relative 'notifications'

# Possible ABCSize errors in notifications
class Mentor < Human
  attr_accessor :subscriptions, :notifs

  def initialize(fullname:)
    @subscriptions = []
    @notifs = Notifications.new
    super
  end

  def check_homework(student, pr_title)
    if findhw(student, pr_title) == 'this is fine code'
      set_mark(student, pr_title, 1)
    else set_mark(student, pr_title, -1)
    end
  end

  def subscribe_to_student(student)
    return unless already_subscribed?(student)

    subscriptions << { student: student, time: Time.now.iso8601(6) }
    student.get_subscriber(self)
  end

  def notifications
    notifs.customized_output
  end

  def read_notifications!
    notifs.read_notifs
  end

  private

  def already_subscribed?(student)
    subscriptions.each do |stu|
      return false if stu[:student].fullname == student.fullname
    end
    true
  end

  def set_mark(student, title, mark)
    student.homeworks.each do |hw|
      hw.mark = mark if hw.pr_title == title
    end
  end

  def findhw(student, pr_title)
    student.homeworks.each do |hw|
      return hw.source_code if hw.pr_title == pr_title
    end
  end
end

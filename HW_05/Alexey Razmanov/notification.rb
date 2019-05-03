# This class serves for create and works with subject Notification
class Notification
  attr_accessor :all_notifications
  def initialize
    @all_notifications = []
  end

  def add_notification(pr_title, student)
    all_notifications << {
      status: 'Unread',
      pr_title: pr_title,
      student: student,
      text: "#{student} do #{pr_title}"
    }
  end

  def read_notifications
    all_notifications.each do |status|
      status[:status] = 'Read' if status[:status].eql?('Unread')
    end
  end
end

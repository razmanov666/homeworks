# Class of notifications
class Notification
  attr_reader :body
  def initialize(student, pr_title, status = 'Unread')
    @body = {
      student: student,
      pr_title: pr_title,
      status: status
    }
  end
end

# This class is used to store and modify notifications
class Notifications
  attr_accessor :notifs

  def initialize
    @notifs = []
  end

  def add_notifs(pr_title, student)
    notifs << {
      student: student.fullname,
      pr_title: pr_title,
      status: 'Unread'
    }
  end

  def customized_output
    out = []
    notifs.select { |note| note[:status].eql?('Unread') }.each do |note|
      out << "Student #{note[:student]} has sent #{note[:pr_title]}"
    end
    out
  end

  def read_notifs
    notifs.each do |note|
      note[:status] = 'Read' if note[:status].eql?('Unread')
    end
  end
end

# description for Mentor
class Mentor
  attr_accessor :notification_list, :subscriptions
  attr_reader :name

  def initialize(name)
    @name = name
    @notification_list = []
    @subscriptions = []
  end

  def subscribe_to(student)
    @subscriptions << student
    student.new_subscriber(self)
  end

  def check_homeworks(student)
    student.homeworks.each do |hw|
      hw.status = if hw.content.include?('ruby')
                    'succeeded'
                  else
                    'failed'
                  end
    end
  end

  def notifications
    @notification_list
  end

  def read_notifitacions!
    @notification_list.each do |note|
      note.status = 'read'
    end
  end
end

require_relative 'homework'
# class mentor
class Mentor < Human
  attr_accessor :notification, :subscribes
  def initialize(_fullname)
    @notification = []
    @subscribes = []
    super
  end

  def subscribe_to_student(student)
    subscribes << student
    student.subscriber(self)
  end

  def notifications
    notification.each do |v|
      return 'not subscribe' unless @subscribes.to_s.include?(v.student)

      puts "notice:<#{v.status}> from student: #{v.student} sent: #{v.pull_r}"
    end
  end

  def check_homework(homework: Homework.new)
    if homework.code.eql?('qwe')
      puts 'Correct homework, congratulations!'
    else
      puts 'Incorrect homework'
    end
  end

  def read_notifications!
    notification.map { |val| val.status = 'read' }
  end
end

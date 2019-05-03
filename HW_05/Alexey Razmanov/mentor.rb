# Class mentor present objects which must to supervise students
class Mentor < Human
  attr_accessor :students
  attr_reader :all_notifications
  def initialize(name, surname)
    super(name, surname)
    @students = ['Subscriptions:', ' ']
    @all_notifications = Notification.new
  end

  def check_homework(homework)
    if homework.code == '1' && homework.pr_title == 'HW_05'
      puts "The mentor says: 'Succes'"
    else
      "The mentor says: 'Try again'"
    end
  end

  def subscribe_to_student(*student)
    students.include?(student) ? return : @students << student
  end

  def show_all_notification
    puts "\n\tAll notification:\n\n"
    all_notifications.all_notifications.each do |note|
      puts "'#{note[:text]}.'\t Status: #{note[:status]}"
    end
  end

  def notification
    puts "\n\tNew notification:\n\n"
    all_notifications.all_notifications.each do |note|
      puts "'#{note[:text]}.'\t Status: #{note[:status]}" if
      note[:status].eql? 'Unread'
    end
  end

  def read_notifications!
    all_notifications.read_notifications
  end

  def show_students
    puts @students
  end
end

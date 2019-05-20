# Class mentor present objects which must to supervise students
class Mentor < Human
  attr_accessor :subscriptions, :subscribers
  attr_reader :notify_mentor
  def initialize(name, surname)
    super(name, surname)
    @subscriptions = []
    @notify_mentor = Notification.new
    # @subscribers = []
  end

  def check_homework(homework)
    if homework.code == '1' && homework.pr_title == 'HW_05'
      puts "The mentor says: 'Succes'"
    else
      "The mentor says: 'Try again'"
    end
  end

  def subscribe_to_student(person)
    subscriptions.include?(person) ? return : @subscriptions << person
    subscriptions.each do |student|
      student.get_subs(self)
    end
  end

  def show_all_notification
    puts "\n\tAll notification:\n\n"
    notify_mentor.all_notifications.each do |note|
      puts "'#{note[:text]}.'\t Status: #{note[:status]}"
    end
  end

  def notification
    puts "\n\tNew notification:\n\n"
    notify_mentor.send_notif_for_mentor
  end

  def read_notifications!
    notify_mentor.read_notifications
  end

  def show_students
    puts "\nSubscriptions:\n\n"
    puts subscriptions
  end
end

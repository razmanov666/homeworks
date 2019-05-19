require_relative 'human'
require_relative 'homework'
require_relative 'modules/check'
require_relative 'modules/message'

# class of Student.
class Student < Human
  include Check
  include Message
  attr_reader :homeworks, :subscribers

  def initialize(name:, surname:)
    @homeworks = []
    @subscribers = []
    super
  end

  def make_homework(source_code, pr_title)
    hw = Homework.new(source_code, fullname, pr_title)
    unless Check::StudentCheck.uniq_hw?(homeworks, hw)
      return Message::StudentMessage.not_uniq_hw
    end

    homeworks << hw
    Message::StudentMessage.homework_created(hw)
  end

  def submit_homework(pr_title)
    hmw = choose_homework(pr_title)
    unless Check::StudentCheck.hw_exist?(hmw)
      return Message::StudentMessage.hw_does_not_exist
    end
    if Check::StudentCheck.already_submitted?(hmw)
      return Message::StudentMessage.already_submitted
    end
    return Message::StudentMessage.failed_submit if hmw.submit_hw == 'failed'

    make_notifications(pr_title)
    Message::StudentMessage.successful_submit
  end

  private

  def choose_homework(pr_title)
    homeworks.each do |hw|
      return hw if hw.body[:pr_title].eql?(pr_title)
    end
  end

  def make_notifications(pr_title)
    subscribers.each do |sub|
      if choose_homework(pr_title).body[:date] > sub[:date]
        sub[:mentor].notifications << Notification.new(fullname, pr_title)
      end
    end
  end
end

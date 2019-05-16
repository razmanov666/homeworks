module Message
  # class of Student messages
  class StudentMessage
    def self.hw_does_not_exist
      "Homework with this Pull Request title doesn't exist."
    end

    def self.not_uniq_hw
      'You already created this homework.'
    end

    def self.homework_created(homework)
      code = homework.body[:source_code]
      pr_title = homework.body[:pr_title]
      "You create #{pr_title} with code: #{code}"
    end

    def self.successful_submit
      'Homework are submitted!'
    end

    def self.failed_submit
      'Something went wrong.'
    end

    def self.already_submitted
      'Homework already submitted!'
    end
  end

  # class of Mentor messages
  class MentorMessage
    def self.not_a_student
      'This not a student!'
    end

    def self.not_uniq_student
      'You are already subscribed to this student.'
    end

    def self.successful_subscription(student)
      "Successful subscription to #{student.name}"
    end

    def self.hw_does_not_exist
      "Homework with this Pull Request title doesn't exist"
    end

    def self.pretty_notification(notifications)
      notifs = []
      notifications.each.select do |notif|
        student = notif.body[:student]
        homework = notif.body[:pr_title]
        status = notif.body[:status]
        notifs << "Student #{student} has sent #{homework}. Status: #{status}"
      end
      notifs
    end
  end
end

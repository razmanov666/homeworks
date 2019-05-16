module Check
  # class of Student checks
  class StudentCheck
    def self.hw_exist?(hmw)
      return true if hmw.class == Homework

      false
    end

    def self.uniq_hw?(homeworks, homework)
      homeworks.each do |hw|
        return false if hw.body[:pr_title].eql?(homework.body[:pr_title])
      end
      true
    end

    def self.uniq_notif?(notifications, fullname, pr_title)
      notifications.each do |ntf|
        if ntf.body[:fullname] == fullname && ntf.body[:pr_title] == pr_title
          return false
        end
      end
      true
    end

    def self.already_submitted?(homework)
      return true if homework.body[:submitted] == true

      false
    end
  end

  # class of Mentor checks
  class MentorCheck
    def self.student?(student)
      return false if student.class != Student

      true
    end

    def self.uniq_student?(subscriptions, student)
      subscriptions.each do |sub|
        return false if sub[:student].eql?(student)
      end
      true
    end
  end
end

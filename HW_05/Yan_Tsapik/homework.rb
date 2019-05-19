# discribes Homework
class Homework
  attr_accessor :title, :content, :status, :author

  def initialize(title, content, author)
    @status = false
    @title = title
    @content = content
    @author = author
    notify
  end

  def notify
    @author.subscribers.each do |m|
      m.notifications << Notification.new(m, author, self)
    end
  end

  def to_s
    "#{@title}, Contents: #{@content}, status: #{@status}"
  end
end

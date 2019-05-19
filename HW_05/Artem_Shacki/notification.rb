# description for Notification
class Notification
  attr_accessor :sender, :receiver, :content, :status

  def initialize(sender, receiver, content)
    @sender = sender
    @receiver = receiver
    @content = content
    @status = 'unread'
  end

  def to_s
    "Student #{@sender.name} has sent #{@content}
    Status #{@status}"
  end
end

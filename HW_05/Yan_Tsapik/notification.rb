# discribes Notification
class Notification
  attr_accessor :whom, :from_whom, :content, :status

  def initialize(whom, from_whom, content)
    @whom = whom
    @from_whom = from_whom
    @content = content
    @status = false
  end

  def to_s
    "To: #{@whom.name},from: #{@from_whom.name},
     Contents: #{@content}, status: #{@status}"
  end
end

# class Notification
class Notification
  attr_accessor :status
  attr_reader :student, :pull_r
  def initialize(status: '', student: '', pull_r: '')
    @status = status
    @student = student
    @pull_r = pull_r
  end
end

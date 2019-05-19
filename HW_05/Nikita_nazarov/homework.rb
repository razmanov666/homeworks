# class homework
class Homework
  attr_reader :code, :student, :pull_r
  def initialize(code: '', student: '', pull_r: '')
    @code = code
    @student = student
    @pull_r = pull_r
  end
end

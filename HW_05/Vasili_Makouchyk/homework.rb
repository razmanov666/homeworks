# Homework model with ability to accept and check
class Homework
  attr_reader :task, :name, :source, :accepted

  def initialize(task: 'write smth', name: 'T1')
    @task = task
    @name = name
    @source = ''
    @accepted = false
  end

  def check_by(mentor)
    accept if source.include? mentor.claim
  end

  def accepted?
    @accepted
  end

  def create(source)
    @source = source
  end

  def accept
    @accepted = true
  end

  def to_s
    "#{@name},\nTask: #{@task},\nStatus: #{status}"
  end

  private

  def status
    @accepted ? 'accepted' : 'not accepted'
  end
end

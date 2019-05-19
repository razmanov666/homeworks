require_relative 'homework'
require_relative 'student'

# Adds notifications for mentors with ability to set status to 'read'
class Notification
  attr_reader :from, :homework

  def initialize(from: 'John Doe 0', homework: '.rb', name: 'T1')
    @status = false
    @source = homework
    @from = from
    @name = name
  end

  def read
    @status = true
  end

  def to_s
    "From: #{@from}\n"\
    "Homework: #{@source}\n"\
    "Status: #{status}"
  end

  def from_student(student)
    hw = student.homeworks.last
    @from = "#{student.name} #{student.id}",
            @source = hw.source,
            @name = hw.name
    self
  end

  private

  def status
    @status ? 'read' : 'unread'
  end
end

# description for Homework
class Homework
  attr_accessor :title, :creator, :content, :status

  def initialize(title, creator, content)
    @title = title
    @creator = creator
    @content = content
    @status = 'await'
  end

  def to_s
    "homework_source: #{@content},
    student: #{@creator.name},
    pr_title: #{@title}"
  end
end

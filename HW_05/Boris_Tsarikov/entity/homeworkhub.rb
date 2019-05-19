require 'httparty'
# Class for posting your homework through GitHub API
class Homeworkhub
  attr_accessor :homework, :solution, :host

  def initialize(host:)
    @host = host
    @homework = 'No homework'
    @solution = 'No solution'
  end

  def clone_project
    file = File.read('resources/homeworkHub.json')
    task = JSON.parse(file)
    task['task_for_students']
  end

  def merge(mentor)
    puts "Mentor #{mentor.fullname} merge your pull request"
  end

  def push_homework(mentor, hash, task)
    if mentor.class == Mentor
      HTTParty.post(host, body: hash)
      write_info(file_name: 'resources/homeworkHub.json', hash: hash)
      @homework = task
    else
      puts 'Only mentors can post homework'
    end
  end

  def push_solution(hash)
    HTTParty.post(host, body: hash)
    write_info(file_name: 'resources/solution.json', hash: hash)
  end

  def write_info(file_name:, hash:)
    path = File.join file_name
    File.open(path, 'w') { |file| file.write(JSON.generate(hash)) }
  end
end

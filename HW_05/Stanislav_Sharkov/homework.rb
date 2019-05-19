require 'net/http'
require 'time'
require 'json'
# class of Homework
class Homework
  attr_reader :body

  def initialize(source_code, student, pr_title)
    @body = {
      source_code: source_code,
      student: student,
      pr_title: pr_title,
      submitted: false
    }
  end

  def submit_hw
    uri = URI('https://www.example.com')
    begin
      Net::HTTP.post(uri, body.to_json)
      body[:submitted] = true
      body[:date] = Time.now.iso8601(6)
    rescue SocketError
      'failed'
    end
  end
end

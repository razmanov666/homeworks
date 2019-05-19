require 'uri'
require 'net/http'
require 'json'
require 'time'

# Rn that's all what is needed in this class (excluding some more methods).
# Probably I'll change it soon
class Student < Human
  attr_accessor :homeworks, :subscribers

  def initialize(fullname:)
    @homeworks = []
    @subscribers = []
    super
  end

  def get_subscriber(mentor)
    subscribers << mentor
  end

  def do_homework(source, pr_title)
    hw = Homework.new(source_code: source, pr_title: pr_title)
    homeworks << hw
  end

  def submit_homework(pr_title)
    homework = search_homework(pr_title)
    homework.time = Time.now.iso8601(6)
    do_request(homework)
    notify_mentors(pr_title)
  end

  def fix_homework(source, pr_title)
    homework = search_homework(pr_title)
    return homework if homework.mark == 1

    homework.source_code = source
    homework.time = Time.now.iso8601(6)
  end

  private

  def search_homework(pr_title)
    homeworks.each do |hw|
      return hw if hw.pr_title == pr_title
    end
  end

  # webhook.site provides free service to test your app sending
  # json without writing tests
  def do_request(homework)
    uri = URI.parse('https://webhook.site/1e9a10c7-54e0-414b-a1a7-3a7dad38c56d')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
    req.body = {
      homework_source: homework.source_code,
      student: fullname,
      pr_title: homework.pr_title
    }.to_json
    http.request(req)
  end

  def notify_mentors(pr_title)
    subscribers.each do |mentor|
      mentor.notifs.add_notifs(pr_title, self)
    end
  end
end

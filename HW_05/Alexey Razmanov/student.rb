# This class present student person
class Student < Human
  attr_accessor :subscribers
  def initialize(name, surname)
    super(name, surname)
    @subscribers = []
  end

  def do_homework(code, pr_title, student)
    hw = Homework.new(code, pr_title, student)
    hw
  end

  def do_request(homework)
    uri = URI.parse('https://example.com/')
    header = { 'Content-Type': 'text/json' }
    body = { code: homework.code, pr_title: homework.pr_title,
             student: homework.student }
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = body.to_json
    response = http.request(request)
    response
  end

  def submit_homework(homework)
    do_request(homework)
    send_notification(homework.pr_title)
  end

  def send_notification(pr_title)
    subscribers.each do |mentor|
      mentor.all_notifications.add_notification(pr_title, self)
    end
  end

  def show_subs
    puts subscribers
  end

  def get_subs(person)
    subscribers.include?(person) ? return : subscribers << person
  end
end

# set Student class
class Student < Human
  attr_accessor :mentor
  attr_reader :hw, :hw_solutions

  def takes_hw(homework)
    @hw = homework
  end

  def complete_hw(solutions_params)
    solutions_params[:student] = "#{first_name} #{last_name}"
    solutions_params[:homework] = hw.hw_number
    @hw_solutions = solutions_params
    HomeworkSolution.new(solutions_params)
  end

  def submit_hw
    Net::HTTP.post URI('http://www.example.com/api/search'),
                   hw_solutions.to_json, 'Content-Type' => 'application/json'
    return unless mentor

    mentor.notifications <<
      { notification:
      "Student #{first_name} #{last_name} has sent #{hw.hw_number}",
        status: 'unread' }
  end
end

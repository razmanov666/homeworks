# Made minor changes to this class. Mark variable explanation:
# It's not a real mark like A-F, 1-10, 1-5 etc.
# mark = 0 is a default homework status
# mark = 1 if it passed all tests
# mark = -1 if it require changes
class Homework
  attr_accessor :source_code, :mark, :time
  attr_reader :pr_title

  def initialize(source_code:, pr_title:)
    @source_code = source_code
    @pr_title = pr_title
    @mark = 0
    @time = 0
  end
end

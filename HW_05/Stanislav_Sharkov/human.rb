# Super class for Student and Mentor.
class Human
  attr_reader :name, :surname, :fullname

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @fullname = @name + ' ' + @surname
  end
end

# class human include fullname (name + surname)
class Human
  attr_reader :fullname
  def initialize(fullname)
    @fullname = fullname
  end
end

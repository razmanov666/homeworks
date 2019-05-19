# Top level class describing a person
class Human
  attr_accessor :fullname, :id

  def initialize(fullname:, id:)
    @fullname = fullname
    @id = id
  end
end

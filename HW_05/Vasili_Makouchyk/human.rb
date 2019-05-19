# ancestor for classes with names and ids
class Human
  attr_reader :id, :name

  def initialize(name: 'John Doe', id: 0)
    @id = id
    @name = name
  end
end

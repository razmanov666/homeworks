# Comment to 2nd commit:
# At the beginning I used class structure thatwe wrote at the lessons
# But since we don't need name and surname as different values (we use them
# both) I reduced number of variables
class Human
  attr_reader :fullname

  def initialize(fullname:)
    @fullname = fullname
  end
end

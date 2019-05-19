require_relative '../notification.rb'

RSpec.describe Notification do
  subject { Notification.new }

  let(:from) { 'John Doe 0' }
  let(:source) { '.rb' }
  let(:name) { 'T1' }
end

require_relative 'spec_helper'

RSpec.describe Notification do
  subject { Notification.new(student, pr_title, status) }
  let(:student) { 'Test student' }
  let(:pr_title) { 'Test pr_title' }
  let(:status) { 'Test status' }

  describe '#body' do
    let(:body) do
      {
        student: student,
        pr_title: pr_title,
        status: status
      }
    end

    it 'returns hash with params' do
      expect(subject.body).to eq body
    end
  end
end

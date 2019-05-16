# rubocop:disable all
require_relative 'spec_helper'

RSpec.describe Homework do
  subject { Homework.new(source_code, student, pr_title) }
  let(:source_code) { 'Test source_code' }
  let(:student) { 'Test student' }
  let(:pr_title) { 'Test pr_title' }
  let(:expected_body) do
    {
      source_code: source_code,
      student: student,
      pr_title: pr_title,
      submitted: false
    }
  end

  describe '#body' do
    it 'returns hash with source_code, student and pr_title' do
      expect(subject.body).to eq expected_body
    end
  end

  describe '#submit_hw' do
    context 'when successful submit' do
      before do
        stub_post_request(subject.body)
      end
      it 'performs POST request to example.com' do
        subject.submit_hw
        expect(WebMock).to have_requested(:post, "https://www.example.com/").with { |req| req.body == expected_body.to_json }
      end

      it 'change submitted on true' do
        expect{ subject.submit_hw }.to change{ subject.body[:submitted] }.to(true)
      end
    end
  end
end
# rubocop:enable all

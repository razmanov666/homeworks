# rubocop:disable all
require_relative 'spec_helper'

RSpec.describe Human do
  subject  { Human.new(params) }
  let(:name) { 'Test Name' }
  let(:surname) { 'Test Surname' }
  let(:params) do
    {
      name: name,
      surname: surname
    }
  end

  describe '#name' do
    it 'returns name' do
      expect(subject.name).to eq name
    end
  end

  describe '#surname' do
    it 'returns surname' do
      expect(subject.surname).to eq surname
    end
  end

  describe '#fullname' do
    it 'returns fullname (name + surname)' do
      expect(subject.fullname).to eq name + ' ' + surname
    end
  end
end
# rubocop:enable all

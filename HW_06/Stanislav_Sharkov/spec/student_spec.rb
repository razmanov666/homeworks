# rubocop:disable all
require_relative 'spec_helper'

RSpec.describe Student do
  subject { Student.new(params) }
  let(:hw) { Homework.new(source_code, subject.fullname, pr_title) }
  let(:name) { 'Test Name' }
  let(:surname) { 'Test Surname'}
  let(:source_code) { 'Test Source code' }
  let(:pr_title) { 'Test Pull Request title' }
  let(:params) do
    {
      name: name,
      surname: surname
    }
  end

  it 'check inheritance from the Human class' do
    expect(described_class).to be < Human
  end

  describe '#homeworks' do
    before do
      subject.make_homework(source_code, pr_title)
    end
    it 'returns array(of homeworks)' do
      expect(subject.homeworks).to be_an_instance_of(Array)
    end

    it 'exist instance of Homework' do
      expect(subject.homeworks).to include(be_an_instance_of(Homework))
    end
  end

  describe '#subscribers' do
    let(:mentor) { Mentor.new(name:'TestName', surname:'TestSurname')}

    it 'returns array of subscribers' do
      expect(subject.subscribers).to be_an_instance_of(Array)
    end

    context 'when student have subscribers' do
      before do
        mentor.subscribe_to_student(subject)
      end
      it 'subscribers array exists hash' do
        expect(subject.subscribers).to include(be_an_instance_of(Hash))
      end

      it 'hash has key mentor with instance of Mentor' do
        expect(subject.subscribers.first[:mentor]).to be_an_instance_of(Mentor)
      end
    end
  end

  describe '#make_homework' do
    context 'when unique homework' do
      it 'add this homework to array of homeworks' do
        expect{ subject.make_homework(source_code, pr_title) }.to change{ subject.homeworks.select.count }.by(1)
      end

      it 'returns message about successful submit' do
        expect(subject.make_homework(source_code, pr_title)).to eq Message::StudentMessage.homework_created(hw)
      end
    end

    context 'when not unique homework' do
      before do
        subject.make_homework(source_code, pr_title)
      end
      it "don't add this homework to array of homeworks" do
        expect{ subject.make_homework(source_code, pr_title) }.not_to change{ subject.homeworks }
      end

      it 'returns message about not unique homework' do
        expect(subject.make_homework(source_code, pr_title)).to eq Message::StudentMessage.not_uniq_hw
      end
    end
  end

  describe '#submit_homework' do
    context 'when successful submit' do
      before do
        subject.make_homework(source_code, pr_title)
        stub_post_request(subject.homeworks.first.body)
      end
      it 'returns message about successful submit' do
        expect(subject.submit_homework(pr_title)).to eq Message::StudentMessage.successful_submit
      end
    end

    context 'when failed submit' do
      before do
        subject.homeworks << hw
        allow(hw).to receive(:submit_hw).and_return('failed')
      end
      it 'returs message about failed submit' do
        expect(subject.submit_homework(pr_title)).to eq Message::StudentMessage.failed_submit
      end
    end

    context "when homework does't exist" do
      it 'returns message about homework does not exist' do
        expect(subject.submit_homework(pr_title)).to eq Message::StudentMessage.hw_does_not_exist
      end
    end
  end
end
# rubocop:enable all

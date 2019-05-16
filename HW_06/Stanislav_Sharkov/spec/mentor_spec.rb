# rubocop:disable all
require_relative 'spec_helper'

RSpec.describe Mentor do
  subject { Mentor.new(params) }
  let(:student) { Student.new(params) }
  let(:name) { 'Test Name' }
  let(:surname) { 'Test Surname' }
  let(:pr_title) { 'Test pr_title' }
  let(:params) do
    {
      name: name,
      surname: surname
    }
  end

  it 'check inheritance from the Human class' do
    expect(described_class).to be < Human
  end

  describe '#subscriptions' do
    it 'returns array' do
      expect(subject.subscriptions).to be_an_instance_of(Array)
    end

    context 'when mentor subscribe to student' do
      before do
        subject.subscribe_to_student(student)
      end
      it 'array exist hash' do
        expect(subject.subscriptions).to include(be_an_instance_of(Hash))
      end

      it 'hash has key student with instance of Student' do
        expect(subject.subscriptions.first[:student]).to be_an_instance_of(Student)
      end
    end
  end

  describe '#subscribe_to_student' do
    context 'when unique subscription' do
      it 'add this student to subscriptions' do
        expect{ subject.subscribe_to_student(student) }.to change{ subject.subscriptions.select.count }.by(1)
      end

      it 'returns message about successful subscription' do
        expect(subject.subscribe_to_student(student)).to eq Message::MentorMessage.successful_subscription(student)
      end
    end

    context 'when not unique subscription' do
      before do
        subject.subscribe_to_student(student)
      end
      it "don't add this student to subscriptions" do
        expect{ subject.subscribe_to_student(student) }.not_to change{ subject.subscriptions }
      end

      it 'returns message about not unique student' do
        expect(subject.subscribe_to_student(student)).to eq Message::MentorMessage.not_uniq_student
      end
    end
  end


  describe '#check_homework' do

    context 'when correct homework' do
      let(:student_homework_by_title) { student.homeworks.find {|hw| hw.body[:pr_title] = pr_title}}

      before do
          student.make_homework('I have best mentors!', pr_title)
      end
      it 'add mark:correct to homework body' do
        expect{ subject.check_homework(student, pr_title) }.to change{ student_homework_by_title.body[:mark]}.to('Correct!')
      end
    end

    context 'when incorrect homework' do
      let(:student_homework_by_title) { student.homeworks.find {|hw| hw.body[:pr_title] = pr_title}}

      before do
        student.make_homework('Test source_code', pr_title)
      end
      it 'add mark:incorrect to homework body' do
        expect{ subject.check_homework(student, pr_title) }.to change{ student_homework_by_title.body[:mark]}.to('Incorrect!')
      end
    end
  end

  describe '#notifications' do
    context 'when mentor subscribe to student before submit homework' do
      let(:expected_notification) do
        {
          student: student.fullname,
          pr_title: pr_title,
          status: 'Unread'
        }
      end

      before do
        subject.subscribe_to_student(student)
        student.make_homework('Test source_code', pr_title)
        stub_post_request(student.homeworks.first.body)
        student.submit_homework(pr_title)
      end
      it 'add notification' do
        expect(subject.notifications.first.body).to eq(expected_notification)
      end
    end

    context "when mentor subscribed to student, but student did't submitted his homework" do
      before do
        subject.subscribe_to_student(student)
        student.make_homework('Test source_code', pr_title)
      end
      it "don't add notification" do
        expect(subject.notifications).to eq([])
      end
    end

    context 'when mentor subscribed to student after submitted homework' do
      before do
        student.make_homework('Test source_code', pr_title)
        stub_post_request(student.homeworks.first.body)
        student.submit_homework(pr_title)
        subject.subscribe_to_student(student)
      end
      it "don't add notification" do
        expect(subject.notifications).to eq([])
      end
    end
  end

  describe '#read_notifications!' do
    let(:expected_notification) do
      {
        student: student.fullname,
        pr_title: pr_title,
        status: 'Read'
      }
    end

    before do
      subject.subscribe_to_student(student)
      student.make_homework('Test source_code', pr_title)
      stub_post_request(student.homeworks.first.body)
      student.submit_homework(pr_title)
      subject.notifications
    end
    it 'change status on Read' do
      expect{ subject.read_notifications! }.to change{ subject.notifications.first.body }.to(expected_notification)
    end
  end
end
# rubocop:enable all

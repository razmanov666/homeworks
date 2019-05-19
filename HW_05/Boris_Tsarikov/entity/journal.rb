# Class for storing student information
class Journal
  attr_reader :student_journal, :notifications

  def initialize(student_journal:, notifications:)
    @student_journal = student_journal
    @notifications = notifications
  end

  def record_student_in_journal(hash)
    write_info(file_name: student_journal, hash: hash)
  end

  def log_a_notice(hash)
    write_all_info(file_name: notifications, hash: hash)
  end

  def record_task_status(hash)
    write_info(file_name: student_journal, hash: hash)
  end

  def write_info(file_name:, hash:)
    path = File.join file_name
    File.open(path, 'w') { |file| file.write(JSON.generate(hash)) }
  end

  def write_all_info(file_name:, hash:)
    path = File.join file_name
    File.open(path, 'a') { |file| file.write(JSON.generate(hash)) }
  end

  def read_info(file_name)
    file = File.read(file_name)
    JSON.parse(file)
  end
end

# Top level class describing a task
class Task
  attr_reader :task_name, :task

  def initialize(task_name:, task:)
    @task_name = task_name
    @task = task
  end

  def record_task(hash)
    write_info('resources/task.json', hash)
  end

  def read_task
    file = File.read('resources/task.json')
    JSON.parse(file)
  end

  # Setter with validation
  def task=(task)
    validation_task(task)
    @task = task
  end

  # Validation method
  def validation_task(solution)
    raise "Input error, this string Task field can't be empty" if
        solution.empty? || solution.class != String
  end

  def write_info(file_name, hash)
    path = File.join file_name
    File.open(path, 'w') { |file| file.write(JSON.generate(hash)) }
  end
end

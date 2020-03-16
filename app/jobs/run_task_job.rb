class RunTaskJob < ApplicationJob
  queue_as :default

  def perform
    sleep Task.first_task.complexity
  end
end

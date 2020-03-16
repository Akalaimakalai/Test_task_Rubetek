class Api::V1::TasksController < Api::V1::BaseController

  def create
    @task = Task.new(task_params)

    if @task.save
      RunTaskJob.perform_later
      head 200
    else
      head 400
    end
  end

  private

  def task_params
    params.require(:task).permit(:complexity, :priority)
  end
end

class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:alert] = "Your task created successfully"
      RunTaskJob.perform_later
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:complexity, :priority)
  end
end

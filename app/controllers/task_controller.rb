class TaskController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    task_params = params[:task]
    @task = Task.new
    @task.user = User.find(task_params[:user])
    @task.completed = false
    @task.priority = Priority.find(task_params[:priority])
    @task.description = task_params[:description]
    @task.deleted = false
    if @task.save
      redirect_to :tasks
    else
      @tasks = Task.all
      render :index
    end
  end

  def update
  end

  def delete
  end
end

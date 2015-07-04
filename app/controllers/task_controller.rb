class TaskController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.active
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
      @tasks = Task.active
      render :index
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.completed = !@task.completed
    @task.save
    redirect_to :tasks
  end

  def delete
  end
end

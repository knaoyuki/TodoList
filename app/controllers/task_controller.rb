class TaskController < ApplicationController
  def index
    @task = Task.new
    cond = params[:condition] || session[:condition] || 1
    cond = cond.to_i
    @cond1 = (cond == 1)
    @cond2 = (cond == 2)
    @cond3 = (cond == 3)
    id = params[:user]
    @trainee = User.where(trainer_id: current_user.id).first
    if @trainee.nil?
    @mytasks = Task.order("priority_id").active(cond,current_user.id)
    else
    @mytasks = Task.order("priority_id").active(cond,current_user.id)
    @traineetasks = Task.order("priority_id").active(cond,t_id)
    end 
    session[:condition] = cond
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
      session[:condition] = 1
      redirect_to :tasks
    else
      @tasks = Task.active(session[:condition],current_user.id)
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
    @task = Task.find(params[:id])
    @task.deleted = true
    @task.save
    redirect_to :tasks
  end
end

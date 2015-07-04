class TaskController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
  end

  def update
  end

  def delete
  end
end

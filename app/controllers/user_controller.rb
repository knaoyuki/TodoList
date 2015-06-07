class UserController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]
  def index
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def delete
  end
end

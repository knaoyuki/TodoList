class UserController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    user_params = params.require(:user).permit(
      :mail,
      :name,
      :password,
      :password_confirmation
    )
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def update
  end

  def delete
  end
end

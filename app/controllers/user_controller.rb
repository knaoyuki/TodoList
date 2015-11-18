class UserController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    user_params = params.require(:user).permit(
      :mail,
      :name,
      :trainer_id,
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
    user_params = params.require(:user).permit(
      :mail,
      :name,
      :trainer_id,
      :password,
      :password_confimation 
    )
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
     redirect_to edit_user_path 
    else
     render :edit
    end
  end

  def delete
  end
end

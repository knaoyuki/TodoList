class AuthController < ApplicationController
  skip_before_filter :require_login, except: [:delete]
  def new
  end

  def create
    @user = login(params[:mail], params[:password])
    if @user
      redirect_to tasks_path
    else
      flash.now[:alert] = "ログイン失敗"
      render :new
    end
  end

  def delete
    logout
    redirect_to login_path
  end
end

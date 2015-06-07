class AuthController < ApplicationController
  skip_before_filter :require_login, except: [:delete]
  def new
  end

  def create
  end

  def delete
  end
end

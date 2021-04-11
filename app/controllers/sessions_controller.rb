class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies[:path]
        redirect_to cookies[:path]
      else
        redirect_to root_path
      end
    else
      flash.now[:alert] = "Are you a Guru? Please verify input data"
      render :new
    end
  end

  def log_out
    session[:user_id] = nil
    redirect_to login_path
  end
end

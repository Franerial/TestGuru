class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to cookies.delete(:path) || root_path
    else
      flash.now[:alert] = "Are you a Guru? Please verify input data"
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)
    redirect_to login_path
  end
end

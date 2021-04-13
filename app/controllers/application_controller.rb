class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    cookies[:path] = request.original_fullpath
    unless current_user
      redirect_to login_path, alert: "Are you a Guru? Please verify input data"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id]) if session[:current_user_id]
  end

  def logged_in?
    current_user.present?
  end
end

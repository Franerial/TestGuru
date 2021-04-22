class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def default_url_options
    I18n.locale == I18n.default_locale ? super : { lang: I18n.locale }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    if current_user.is_a?(Admin)
      admin_tests_path
    else
      tests_path
    end
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :user
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :set_locale
  layout :layout_by_resource

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
  end

  def user
    @user = current_user
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "light"
    else
      "application"
    end
  end

  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def set_locale
    I18n.locale = extract_locale_from_accept_language_header || I18n.default_locale
  end
end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :Username, :email, :birthday, :password, :remember_me, :avatar)}
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :Username, :email, :birthday, :password, :current_password, :remember_me, :avatar)}

  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || posts_path
  end

end

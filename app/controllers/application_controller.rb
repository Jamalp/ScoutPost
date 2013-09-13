class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :phone
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || subscriber_digest_path
  end

  def redirect_sign_in_subscriber
  end
end

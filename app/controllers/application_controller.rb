class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name_pseudonym])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_pseudonym])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:delivery_address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:credit_card])
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

class ApplicationController < ActionController::Base
  include CommonActions
  before_action :set_categories
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :create_q
  before_action :configure_account_update_params, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_pseudonym, :first_name_pseudonym, :birthday, :photo, :phone_number, :profile])
    devise_parameter_sanitizer.permit(:sign_up, keys: [address_attributes: [:id, :post_number, :prefecture, :city, :street, :building]])
    devise_parameter_sanitizer.permit(:sign_up, keys: [deliver_address_attributes: [:id, :post_number, :prefecture, :city, :street, :building, :phone_number]])
    devise_parameter_sanitizer.permit(:sign_up, keys: [deliver_address_attributes: [:id, :post_number, :prefecture, :city, :street, :building, :phone_number]])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo])
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

  def create_q
    @q = Product.ransack(params[:q])
  end

end
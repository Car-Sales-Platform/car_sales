class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :first_name, :last_name, :phone_number)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password, :current_password, :first_name, :last_name, :phone_number, :prefered_name)
    end
  end
end

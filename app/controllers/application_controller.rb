class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def login?
    if current_customer.nil?
      redirect_to login_path, alert: "you have to login"
    end
  end

  def already_login?
    unless current_customer.nil?
      redirect_to customer_path, notice: "you are already login"
    end
  end

  def current_customer
    if session[:customer_id]
      current_customer ||= Customer.find(session[:customer_id])
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:id, :name, :email, :encrypted_password, :encrypted_password_confirmation])
  end


end

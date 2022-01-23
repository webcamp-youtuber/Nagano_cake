class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

  #ログイン後の遷移設定
  def after_sign_in_path_for(resource)
    if customer_signed_in?
       public_customers_path
    else
       admin_root_path
    end
  end

#ログアウト後の遷移設定
  def after_sign_out_path_for(resource)
      root_path
  end

  #会員新規登録の保存機能
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :telephon_numbe, :encrypted_password, :encrypted_password_confirmation])
  end


end

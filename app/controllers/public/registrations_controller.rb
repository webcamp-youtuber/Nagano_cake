class Public::RegistrationsController < ApplicationController

  def new
    @customers = Customer.new
  end

  def create
    @customer = Customer.new(
      last_name: params[:last_name],
      first_name: params[:first_name],
      last_name_kana: params[:last_name_kana],
      first_name_kana: params[:first_name_kana],
      email: params[:email],
      post_code: params[:post_code],
      address: params[:address],
      telephon_number: params[:telephon_number],
      image_name: "default_user.jpg",
      password: params[:encrypted_password]
    )
    if @customer.save
      session[:customer_id] = @customer.id
      flash[:notice] = "会員登録が完了しました"
      redirect_to("/customers/#{@customer.id}")
    else
      render("customers/new")
    end
  end

  private
　def customer_params
　　params_require(:customer).parmit(:id, :name, :email, :encrypted_password, :encrypted_password_confirmation)
　end

end

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
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/customers/#{@customer.id}")
    else
      render("customers/new")
    end
  end

end

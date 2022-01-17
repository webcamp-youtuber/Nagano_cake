class Public::SessionsController < ApplicationController

  def index

  end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && customer.authenticate(params[:session][:encrypted_password])
      log_in customer
      remember customer
      redirect_to root_url
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end



  def destroy
    log_out if logged_in?
    redirect_to root_url
  end



end

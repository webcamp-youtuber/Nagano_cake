class Public::SessionsController < ApplicationController
  before_action :already_login?, except: :destroy

  def new
  end

  def create
    customer = Customer.find_by_email(params[:email])
    if customer && customer.authenticate(params[:password])
      session[:customer_id] = customer.id
      redirect_to customer_path, notice: "you have successfully login"
    else
      flash.now[:alert] = "Email or Password is invalid"
      render :new
    end
  end

  def destroy
    session[:customer_id] = nil
    redirect_to root_path, notice: "you have successfully logout"
  end

end

class Public::CustomersController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update]

  def index
    @customers = Customer.all
  end

  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find_by(id: params[:id])
    if @customer != current_customer
      redirect_to customer_path
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

  def unsubscribe
  end

  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :name_kana, :post_code, :address, :telephon_number, :email)
  end

  def ensure_correct_customer
    @customer = Customer.find_by(id:params[:id])

  end

end

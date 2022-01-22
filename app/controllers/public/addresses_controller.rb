class Public::AddressesController < ApplicationController

  def new
    @adress = Adress.new
  end

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = current_customer
  end

  def create
    @adress = Adress.new(adress_params)
    if @adress.save
      # redirect_to adresses_url(id: current_user.id)
      redirect_to public_address_index_path
    else
      render 'new'
    end
  end

  def update
    @address = current_customer
  end

  def destroy
    @address = current_customer. public_address_index
    @address.destroy
    redirect_to public_address_index_path
  end

  private
  def adress_params
    params.require(:adress).permit(:customer_id, :post_code, :address, :destination)
  end

end

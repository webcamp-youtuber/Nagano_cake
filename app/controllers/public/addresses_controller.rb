class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = current_customer
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to public_addresses_index_path
    else
      render 'index'
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
  def address_params
    params.require(:address).permit(:customer_id, :post_code, :address, :destination)
  end

end

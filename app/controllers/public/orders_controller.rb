class Public::OrdersController < ApplicationController

  def new
  	@order = Order.new
  	@shipping_addresses = Address.where(customer: current_customer)
  end

  

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.postage = 800
    @current_customer_order = current_customer
    if params[:order][:address_number] == "1"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == "2"
      if Address.exists?(name: params[:order][:registered])
        @order.post_code = Address.find(params[:order][:registered]).post_code
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
      else
        render.new
      end
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
      render :new
      end
    end


    #合計金額
    sum = 0
    @cart_items.each do |cart_item|
      sum += (cart_item.quantity * cart_item.product.add_tax_price)
    end
    @total_price = sum

    sum = 0
    @cart_items.each do |cart_item|
      sum += (cart_item.product.add_tax_price * cart_item.quantity)
    end
    sum += @order.postage
    @order.bill_maney = sum
  end


  def show
  end

  def index
  end

  def complate
  end

private

def order_params
  params.permit(:customer_id, :bill_maney, :postage, :payment_method, :adress, :post_code, :destination, :order_status)
end

def address_params
  params.permit(:name, :address, :post_code)
end

end


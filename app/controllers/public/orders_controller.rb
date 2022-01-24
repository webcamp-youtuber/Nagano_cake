class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

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
      @order.adress = current_customer.address
      @order.destination = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == "2"
      if Address.exists?(name: params[:order][:registered])
        @order.post_code = Address.find(params[:order][:registered]).post_code
        @order.destination = Address.find(params[:order][:registered]).name
        @order.adress = Address.find(params[:order][:registered]).address
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

  def create
    @order = current_customer.orders.new(order_params)
    @order.postage = 800
    if @order.save
     # カート商品の情報を注文商品に移動
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    @order_details = OrderDetail.new
     @order_details.product_id = cart_item.product_id
     @order_details.order_id = @order.id
     @order_details.quantity = cart_item.quantity
     @order_details.payment = cart_item.product.selling_price*cart_item.quantity
     @order_details.production_status = 0
     @order_details.save
    end
    # 注文完了後、カート商品を空にする
    @cart_items.destroy_all
    redirect_to public_orders_complate_path
    end
  end

  def complate
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def index
  end

private

def order_params
  params.require(:order).permit(:customer_id, :bill_maney, :postage, :payment_method, :adress, :post_code, :destination, :order_status)
end

def address_params
  params.require(:adress).permit(:name, :address, :post_code)
end

<<<<<<< HEAD
end
=======
end
>>>>>>> origin/develop

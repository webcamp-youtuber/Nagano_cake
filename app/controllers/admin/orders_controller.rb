class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.all.page(params[:page]).per(10)
  end


  def show
    @order = Order.find(params[:id])
		@order_details = @order.order_details
		@order.postage = 800
    #合計金額
    sum = 0
    @order_details.each do |order_details|
      sum += (order_details.quantity * order_details.product.add_tax_price)
    end
    @total_price = sum
    @total_bill_maney = (sum + @order.postage)


  end

  def update
    @order = Order.find(params[:id])
		if @order.update(order_params)
		  redirect_to admin_order_path(@order)
		else
		   render "show"
		end
  end

  private
	def order_params
		  params.require(:order).permit(:customer_id, :bill_maney, :postage, :payment_method, :address, :post_code, :destination, :order_status)
	end
end

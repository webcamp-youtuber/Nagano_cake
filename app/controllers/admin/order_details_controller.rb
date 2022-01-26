class Admin::OrderDetailsController < ApplicationController

 before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
	if @order_detail.update(order_detail_params)
	   if @order_detail.production_status == "produced"
	      @order = @order_detail.order
	      @order.update(order_status: 2 )
	   end
	      @order = @order_detail.order
	      order_details = @order.order_details
	      sum = 0
	      order_details.each do |order_detail|
	        if order_detail.production_status == "production_completed"
	          sum += 1
	          if order_details.count == sum
	            @order.update(order_status: 3 )
	          end
	        end
	      end

     redirect_to admin_order_path(@order_detail.order)
    else
	render "show"
	end
  end

  private
    def order_detail_params
		  params.require(:order_detail).permit(:production_status)
    end

end

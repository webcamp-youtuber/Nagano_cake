class Public::CartItemsController < ApplicationController



  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.public_customer_id = current_public_customer.id

    if current_customer.cart_products.find_by(product_id: params[:cart_item][:product_id]).present?
      @cart_item = current_customer.cart_products.find_by(product_id: params[:cart_item][:product_id])
      @cart_item.quantity += params[:cart_item][:quantity].to_i
      @cart_item.save
      redirect_to public_cart_items_path
    else
      @cart_item.save
      redirect_to public_cart_items_path
    end

  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to public_cart_items_path
    else
      @cart_items = CartItem.all
      render :index
    end
  end



  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end


  private

  def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
  end

end


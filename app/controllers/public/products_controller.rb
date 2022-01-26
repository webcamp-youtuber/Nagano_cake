class Public::ProductsController < ApplicationController
  def index
   @products = Product.all.page(params[:page]).per(18)
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @product = Product.find(params[:id])
    @image = @product.image
    @cart_items =CartItem.new
  end


end

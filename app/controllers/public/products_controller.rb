class Public::ProductsController < ApplicationController
  def index
    @products = Product.all
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @product = Product.find(params[:id])
    @image = @product.image
    @cart_items =CartItem.new
  end


end

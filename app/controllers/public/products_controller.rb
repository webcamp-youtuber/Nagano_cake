class Public::ProductsController < ApplicationController
  def index
    @products = Product.all
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @product = Product.find(params[:id])
  end





def product_params
   params.require(:product).permit(:product_name, :image, :genre, :introduction, :is_sales_status, :price_without_tax)
end


end

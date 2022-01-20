class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :explanation, :genre_id, :selling_price, :is_selling)
  end

end

class Public::ProductsController < ApplicationController
  def index
    @quantity = Product.count
  end

  def show
    @product = Product.find(params[:id])
  end


end

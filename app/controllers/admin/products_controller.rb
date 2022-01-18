class Admin::ProductsController < ApplicationController

private
  def product_params
    params.require(:product).permit(:name, :body, :genre_id)
  end

end

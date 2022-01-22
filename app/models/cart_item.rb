class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :customer

  validate :quantity

  def subtotal
    product.add_tax_price * quantity
  end


end
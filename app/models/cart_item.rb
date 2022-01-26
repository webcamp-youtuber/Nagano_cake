class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :customer

validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than: 10 }

  def subtotal
    product.add_tax_price * quantity
  end


end
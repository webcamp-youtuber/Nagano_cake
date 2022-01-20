class CartItem < ApplicationRecord

  validates :quantity

  def subtotal
    product.add_tax_price * quantity
  end

  belongs_to :product
  belongs_to :customer

end

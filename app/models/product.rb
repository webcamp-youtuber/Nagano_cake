class Product < ApplicationRecord

  belongs_to :genre
  has_many :cart_items
  has_many :orders, through: :order_datails
  has_many :order_details

  enum is_selling: { on_sale: 0, no_sale: 1}
  attachment :image

  def with_tax_price
     (price_without_tax * 1.1).floor
  end



end
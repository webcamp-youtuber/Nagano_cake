class Product < ApplicationRecord

  belongs_to :genre
  has_many :cart_items
  has_many :orders, through: :order_datails
  has_many :order_details

  enum is_selling: { on_sale: true, no_sale: false }
  attachment :image

  def add_tax_price
    (self.selling_price * 1.1).round
  end

  validates :name, presence: true
  validates :genre_id, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :selling_price, presence: true
  validates :is_selling, presence: true

end
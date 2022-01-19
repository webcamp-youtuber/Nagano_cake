class Product < ApplicationRecord

  belongs_to :genre
  has_many :cart_items
  has_many :orders, through: :order_datails
  has_many :order_details

  attachment :image

  def add_tax_price
     (self.price * 1.1).round
  end

  validates :name, presence: true
  validates :genre_id, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :price, presence: true


end
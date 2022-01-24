class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

 enum order_status: {
   waiting_deposit: 0,
   payment_confirmation: 1,
   production: 2,
   preparing_delivery: 3,
   sent: 4
 }


end

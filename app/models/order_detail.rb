class OrderDetail < ApplicationRecord

  belongs_to :product
  belongs_to :order

enum production_status:{
  not_startable: 0,
  waiting_production: 1,
  produced: 2,
  production_completed: 3, 
}
  

end


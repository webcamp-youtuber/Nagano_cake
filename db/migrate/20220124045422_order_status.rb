class OrderStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:order_details, :production_status, 0 )
  end
end

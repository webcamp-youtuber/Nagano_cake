class ChangeDatatypeQuantityOfOrderDetails < ActiveRecord::Migration[5.2]
  def change
    change_column :order_details, :quantity, :integer
  end
end

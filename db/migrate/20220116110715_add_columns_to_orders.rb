class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :adress, :string
    add_column :orders, :post_code, :string
    add_column :orders, :destination, :string
    add_column :orders, :order_status, :string
  end
end

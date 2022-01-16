class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :product_id
      t.integer :payment_id
      t.string :quantity
      t.string :integer
      t.integer :payment
      t.integer :production_status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end

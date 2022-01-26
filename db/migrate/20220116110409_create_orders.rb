class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :bill_maney
      t.integer :postage
      t.string :payment_method

      t.timestamps
    end
  end
end

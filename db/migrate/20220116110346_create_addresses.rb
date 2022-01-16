class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :destination
      t.string :address
      t.string :post_code
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end

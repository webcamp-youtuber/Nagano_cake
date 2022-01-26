class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :explanation
      t.integer :selling_price
      t.boolean :is_selling
      t.datetime :create_at
      t.datetime :update_at

      t.timestamps
    end
  end
end

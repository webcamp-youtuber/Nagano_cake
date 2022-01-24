class RenamePaymentIdColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_details, :payment_id, :order_id
  end
end

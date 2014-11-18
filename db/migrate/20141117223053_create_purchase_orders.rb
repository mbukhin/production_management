class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.string :name
      t.integer :purchase_order_status_id

      t.timestamps
    end
  end
end

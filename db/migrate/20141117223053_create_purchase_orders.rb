class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end

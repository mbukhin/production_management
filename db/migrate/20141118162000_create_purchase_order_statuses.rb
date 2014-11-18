class CreatePurchaseOrderStatuses < ActiveRecord::Migration
  def change
    create_table :purchase_order_statuses do |t|
      t.string :name
      t.timestamps
    end
  end
end

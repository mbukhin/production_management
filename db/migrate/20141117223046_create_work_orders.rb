class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.references :worker, index: true
      t.string :status
      t.references :product_configuration, index: true
      t.references :purchase_order, index: true

      t.timestamps
    end
  end
end

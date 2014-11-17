class CreateWorkOrderStatusHistories < ActiveRecord::Migration
  def change
    create_table :work_order_status_histories do |t|
      t.references :work_order, index: true
      t.string :status

      t.timestamps
    end
  end
end

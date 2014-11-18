class CreateStyleSizes < ActiveRecord::Migration
  def change
    create_table :style_sizes do |t|
      t.string :name
      t.timestamps
    end
  end
end

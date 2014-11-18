class CreateStyleColors < ActiveRecord::Migration
  def change
    create_table :style_colors do |t|
      t.string :name
      t.timestamps
    end
  end
end

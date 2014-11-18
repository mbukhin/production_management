class CreateProductConfigurations < ActiveRecord::Migration
  def change
    create_table :product_configurations do |t|
      t.string :name
      t.float :cogs
      t.float :weight
      t.references :product, index: true
      t.references :style_size, index: true
      t.references :style_color, index: true

      t.string :sku

      t.timestamps
    end
  end
end

class CreateProductConfigurations < ActiveRecord::Migration
  def change
    create_table :product_configurations do |t|
      t.string :color
      t.string :size
      t.float :cogs
      t.references :product, index: true
      t.string :sku
      t.string :image_url

      t.timestamps
    end
  end
end

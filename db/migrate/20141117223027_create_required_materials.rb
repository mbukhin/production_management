class CreateRequiredMaterials < ActiveRecord::Migration
  def change
    create_table :required_materials do |t|
      t.references :product_configuration, index: true
      t.float :amount
      t.references :material, index: true

      t.timestamps
    end
  end
end

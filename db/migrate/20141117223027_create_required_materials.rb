class CreateRequiredMaterials < ActiveRecord::Migration
  def change
    create_table :required_materials do |t|
      t.string :name	
      t.references :product_configuration, index: true
      t.float :amount
      t.string :units      
      t.references :material, index: true

      t.timestamps
    end
  end
end

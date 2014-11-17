class CreateMaterialChanges < ActiveRecord::Migration
  def change
    create_table :material_changes do |t|
      t.float :amount
      t.text :notes
      t.references :material, index: true

      t.timestamps
    end
  end
end

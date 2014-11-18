class CreateMaterialChanges < ActiveRecord::Migration
  def change
    create_table :material_changes do |t|
      t.string :name
      t.float :amount
      t.text :notes
      t.string :units
      t.references :material, index: true
      t.boolean :disable

      t.timestamps
    end
  end
end

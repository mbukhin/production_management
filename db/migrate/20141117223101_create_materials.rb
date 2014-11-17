class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :unit
      t.string :internal_name

      t.timestamps
    end
  end
end

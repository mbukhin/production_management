class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.string :photo_url
      t.string :cell_phone
      t.text :notes

      t.timestamps
    end
  end
end

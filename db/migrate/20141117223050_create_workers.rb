class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :photo_url
      t.string :last_name
      t.text :notes

      t.timestamps
    end
  end
end

class CreateLostLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :lost_locations do |t|
      t.string :city
      t.string :district
      t.references :lost_pet, foreign_key: true

      t.timestamps
    end
  end
end

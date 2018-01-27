class CreateLostPets < ActiveRecord::Migration[5.1]
  def change
    create_table :lost_pets do |t|
      t.string :name
      t.integer :type
      t.integer :age
      t.string :lost_time
      t.integer :status

      t.timestamps
    end
  end
end

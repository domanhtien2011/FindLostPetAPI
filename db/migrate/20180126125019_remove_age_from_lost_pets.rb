class RemoveAgeFromLostPets < ActiveRecord::Migration[5.1]
  def change
    remove_column :lost_pets, :age, :decimal
  end
end

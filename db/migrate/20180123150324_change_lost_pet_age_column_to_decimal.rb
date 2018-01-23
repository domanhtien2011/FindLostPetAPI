class ChangeLostPetAgeColumnToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :lost_pets, :age, :decimal
  end
end

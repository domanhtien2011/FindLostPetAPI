class ChangeTypeFromLostPet < ActiveRecord::Migration[5.1]
  def change
    remove_column :lost_pets, :type, :integer if column_exists? :lost_pets, :type
    add_column :lost_pets, :breed, :integer  unless column_exists? :lost_pets, :type
  end
end

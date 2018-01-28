class AddUserIdToLostPets < ActiveRecord::Migration[5.1]
  def change
    add_column :lost_pets, 
                :user_id, 
                :integer,
                index: true,
                foreign_key: true
  end
end

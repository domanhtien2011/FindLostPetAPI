class ChangeStatusDefaultValueInLostPet < ActiveRecord::Migration[5.1]
  def change
    change_column_default :lost_pets, :status, 'finding'
  end
end

class ChangeLostTimeColumnToDatetime < ActiveRecord::Migration[5.1]
  def change
    remove_column :lost_pets, :lost_time if column_exists?(:lost_pets, :lost_time)
    add_column :lost_pets, :lost_time, :datetime
  end
end

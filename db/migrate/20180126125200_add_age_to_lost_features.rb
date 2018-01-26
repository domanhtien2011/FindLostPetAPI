class AddAgeToLostFeatures < ActiveRecord::Migration[5.1]
  def change
    add_column :lost_features, :age, :decimal
  end
end

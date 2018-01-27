class ChangeWeightFromLostFeatureToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :lost_features, :weight, :decimal
  end
end

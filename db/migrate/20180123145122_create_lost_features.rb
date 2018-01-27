class CreateLostFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :lost_features do |t|
      t.integer :weight
      t.string :fur_color
      t.string :others
      t.references :lost_pet, foreign_key: true

      t.timestamps
    end
  end
end

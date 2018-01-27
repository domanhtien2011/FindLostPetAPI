# == Schema Information
#
# Table name: lost_features
#
#  id          :integer          not null, primary key
#  weight      :decimal(, )
#  fur_color   :string
#  others      :string
#  lost_pet_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  age         :decimal(, )
#
# Indexes
#
#  index_lost_features_on_lost_pet_id  (lost_pet_id)
#
# Foreign Keys
#
#  fk_rails_...  (lost_pet_id => lost_pets.id)
#

class LostFeature < ApplicationRecord
  belongs_to :lost_pet
  validates_presence_of %i[weight fur_color lost_pet_id age]
end

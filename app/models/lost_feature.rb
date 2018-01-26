# == Schema Information
#
# Table name: lost_features
#
#  id          :integer          not null, primary key
#  weight      :integer
#  fur_color   :string
#  others      :string
#  lost_pet_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  age         :decimal(, )
#

class LostFeature < ApplicationRecord
  belongs_to :lost_pet
  validates_presence_of %i[weight fur_color lost_pet_id age]
end

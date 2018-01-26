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

require 'rails_helper'

RSpec.describe LostFeature, type: :model do
  it { should belong_to(:lost_pet) }
  it { should validate_presence_of(:age) }
  it { should validate_presence_of(:weight) }
  it { should validate_presence_of(:fur_color) }
  it { should validate_presence_of(:lost_pet_id) }
end

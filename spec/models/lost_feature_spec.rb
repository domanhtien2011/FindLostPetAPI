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

require 'rails_helper'

RSpec.describe LostFeature, type: :model do
  it { should belong_to(:lost_pet) }
  it { should validate_presence_of(:age) }
  it { should validate_presence_of(:weight) }
  it { should validate_presence_of(:fur_color) }
  it { should validate_presence_of(:lost_pet_id) }
end

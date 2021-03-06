# == Schema Information
#
# Table name: lost_locations
#
#  id          :integer          not null, primary key
#  city        :string
#  district    :string
#  lost_pet_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_lost_locations_on_lost_pet_id  (lost_pet_id)
#
# Foreign Keys
#
#  fk_rails_...  (lost_pet_id => lost_pets.id)
#

require 'rails_helper'

RSpec.describe LostLocation, type: :model do
  it { should belong_to(:lost_pet) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:district) }
  it { should validate_presence_of(:lost_pet_id) }
end

# == Schema Information
#
# Table name: lost_pets
#
#  id         :integer          not null, primary key
#  name       :string
#  status     :integer          default("finding")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lost_time  :datetime
#  breed      :integer
#

require 'rails_helper'

RSpec.describe LostPet, type: :model do
  it { should have_one(:lost_location).dependent(:destroy) }
  it { should have_one(:lost_feature).dependent(:destroy) }
  it { should define_enum_for(:breed).with(%w[dog cat other]) }
  it { should define_enum_for(:status).with(%w[finding found]) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:lost_time) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:breed) }
end

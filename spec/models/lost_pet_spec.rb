require 'rails_helper'

RSpec.describe LostPet, type: :model do
  it { should have_one(:lost_location).dependent(:destroy) }
  it { should have_one(:lost_feature).dependent(:destroy) }
  it { should define_enum_for(:type).with(%w(dog cat other)) }
  it { should define_enum_for(:status).with(%w(finding found)) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:age) }
  it { should validate_presence_of(:lost_time) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:type) }
end

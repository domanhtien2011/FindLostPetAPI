# == Schema Information
#
# Table name: lost_pets
#
#  id         :integer          not null, primary key
#  name       :string
#  type       :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lost_time  :datetime
#

class LostPet < ApplicationRecord
  enum status: %w(finding found)
  enum type: %w(dog cat other)
  has_one :lost_location, dependent: :destroy
  has_one :lost_feature, dependent: :destroy
  validates_presence_of %i(name lost_time type status)
end

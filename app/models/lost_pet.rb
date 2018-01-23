class LostPet < ApplicationRecord
  enum status: %w(finding found)
  enum type: %w(dog cat other)
  has_one :lost_location, dependent: :destroy
  has_one :lost_feature, dependent: :destroy
  validates_presence_of %i(name age lost_time type status)
end

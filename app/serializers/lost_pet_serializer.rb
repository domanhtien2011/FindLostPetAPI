class LostPetSerializer < ActiveModel::Serializer
  attributes %i[id name status breed lost_time]
  has_one :user
  has_one :lost_location
  has_one :lost_feature
end

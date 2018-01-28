class LostPetSerializer < ActiveModel::Serializer
  attributes %i[id name status breed]
  has_one :user
end

class UserSerializer < ActiveModel::Serializer
  attributes %i[id email name phone]
end

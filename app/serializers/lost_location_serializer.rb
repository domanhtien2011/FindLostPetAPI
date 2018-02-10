class LostLocationSerializer < ActiveModel::Serializer
  attributes %i[city district]
end

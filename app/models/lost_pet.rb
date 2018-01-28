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
#  user_id    :integer
#

class LostPet < ApplicationRecord
  enum status: %w[finding found]
  enum breed: %w[dog cat other]
  belongs_to :user
  has_one :lost_location, dependent: :destroy
  has_one :lost_feature, dependent: :destroy
  validates_presence_of %i[name lost_time breed status]
end

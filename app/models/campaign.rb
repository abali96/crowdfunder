class Campaign < ActiveRecord::Base
  has_many :rewards
  has_many :users, through: :rewards
  belongs_to :user
end

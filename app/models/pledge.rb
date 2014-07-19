class Pledge < ActiveRecord::Base
  belongs_to :reward
  belongs_to :user
  has_one :campaign, :through => :reward
  validates :user_id, :presence => true
end

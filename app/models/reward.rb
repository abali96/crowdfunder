class Reward < ActiveRecord::Base
  belongs_to :campaign
  has_many :pledges
  validates :name, :description, :presence => true
  validates :description, :length => { maximum: 250 }
  validates :amount, :numericality => {:only_integer => true}
end

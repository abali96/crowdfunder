class Reward < ActiveRecord::Base
  belongs_to :campaign
  validates :name, :description, :presence => true
  validates :amount, :numericality => {:only_integer => true}
end

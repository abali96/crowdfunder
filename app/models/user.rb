class User < ActiveRecord::Base
  has_many :campaigns
  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :comments, as: :commentable
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email


end

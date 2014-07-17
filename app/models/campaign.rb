class Campaign < ActiveRecord::Base
  has_many :rewards
  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true
  has_many :users, through: :rewards
  belongs_to :user
  validates :name, :description, :goal, :start_date, :end_date, :category, :presence => true
  validate :appropriate_dates

  # def total_earned
  # total_earning = 0
  # pledged = 1
  # earned = Reward.where(@campaign)
  # earned.each do |amt|
  #   pledged = Pledge.where("reward_id = ?", amt).count
  #   total_reward = (pledged * amt.amount)
  #   total_earning += total_reward
  # end
  # total_earning
  # end

  def appropriate_dates
  if start_date && end_date
    if start_date > end_date
      errors.add(:base, "You can't end your campaign before it starts!")
    end
  end
  end
end
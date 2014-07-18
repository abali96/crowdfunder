class Campaign < ActiveRecord::Base
  has_many :rewards
  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true
  has_many :users, through: :rewards
  belongs_to :user
  validates :name, :description, :goal, :start_date, :end_date, :category, :presence => true
  validate :appropriate_dates

  def total_earned
    total = 0
    self.rewards.each do |r|
      total += (r.amount * r.pledges.count)
    end
    total
  end

  def appropriate_dates
  if start_date && end_date
    if start_date > end_date
      errors.add(:base, "You can't end your campaign before it starts!")
    end
  end
  end
end
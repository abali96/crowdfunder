class Campaign < ActiveRecord::Base
  has_many :rewards
  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true
  has_many :users, through: :rewards
  belongs_to :user
  validate :appropriate_dates


  def appropriate_dates
    if start_date > end_date
      errors.add(:base, "You can't end your campaign before it starts!")
    end
  end
end

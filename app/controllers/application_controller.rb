class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def not_authenticated
  redirect_to login_url, :alert => "First login to access this page."
end

def total_earned
  total_earning = 0
  pledged = 1
  earned = Reward.where("campaign_id = ?", @campaign.id)
  earned.each do |amt|
    pledged = Pledge.where("reward_id = ?", amt).count
    total_reward = (pledged * amt.amount)
    total_earning += total_reward
  end
  total_earning
end

def pledge_status
  rewarded = current_user.rewards.select(:campaign_id, :id).distinct
  rewarded.each do |r|
    if @campaign.id == r.campaign_id
      return true
      break
    else
      return false
    end
  end
end

end

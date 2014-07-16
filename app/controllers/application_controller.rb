class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def not_authenticated
  redirect_to login_url, :alert => "First login to access this page."
end

def total_earned
  total_earning = 0
  earned = Reward.where("campaign_id = :id")
  earned.each do |amt|
    pledged = Pledge.where("reward_id = amt.id").count
    total_earning = pledged
  end 
  total_earning
end

end

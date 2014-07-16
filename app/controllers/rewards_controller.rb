class RewardsController < ApplicationController

  def pledge
    @reward = Reward.find(params[:id])
    @pledge = @reward.pledges.create (attributes = {user_id: current_user.id})
    redirect_to campaign_path(@campaign)
  end

end

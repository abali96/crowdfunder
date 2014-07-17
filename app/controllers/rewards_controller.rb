class RewardsController < ApplicationController

  def pledge
    @reward = Reward.find(params[:id])
    @pledge = @reward.pledges.create (attributes = {user_id: current_user.id})
    @rewards = Reward.where("campaign_id = ?", @reward.campaign_id)
    @pledges = Pledge.all
    @campaign =  @reward.campaign

    rewarded = current_user.rewards.select(:campaign_id, :id).distinct
    rewarded.each do |r|
      if @campaign.id == r.campaign_id
        @pledge_status = true
        break
      else
        @pledge_status = false
      end
    end

    respond_to do |format|
      if @pledge.save
        format.html {redirect_to campaigns_path, notice: "Pledge accepted!"}
        format.js
      else
        format.html {render 'campaigns/show', alert: "There was an error"}
        format.js
      end
    end
  end
end

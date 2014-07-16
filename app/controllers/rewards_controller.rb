class RewardsController < ApplicationController

  def pledge
    @reward = Reward.find(params[:id])
    @pledge = @reward.pledges.create (attributes = {user_id: current_user.id})
    @rewards = Reward.where("campaign_id = ?", @reward.campaign_id)
    @pledges = Pledge.all

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

class CampaignsController < ApplicationController
  before_action :require_login, :except => [:show, :index]

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @rewards = @campaign.rewards.all
    @pledges = Pledge.all
    @reward_campaign = @campaign.rewards
    @totals = total_earned
    @pledge_status = pledge_status
  end


  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.build(campaign_params)

    if @campaign.save
      redirect_to campaigns_path
    else
      render :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])

    if @campaign.update_attributes(campaign_params)
      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
  end


  private
  def campaign_params
    params.require(:campaign).permit(:name, :description, :goal, :start_time, :end_time, rewards_attributes: [:name, :description, :amount, :_destroy])
  end

end

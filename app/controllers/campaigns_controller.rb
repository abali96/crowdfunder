class CampaignsController < ApplicationController
  before_action :require_login, :except => [:show, :index]
  before_action :authenticate_creator, :only => [:edit, :update, :destroy]
  def index
    if params[:tag]
      @campaigns = Campaign.tagged_with(params[:tag])
    else
      @campaigns = Campaign.all
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    @rewards = @campaign.rewards.all
    @pledges = Pledge.all
    @reward_campaign = @campaign.rewards
    @comments = @campaign.comments.all

    if current_user
      @comment = @campaign.comments.build
    end

    if current_user
      rewarded = current_user.rewards.select(:campaign_id, :id).distinct
      rewarded.each do |r|
        if @campaign.id == r.campaign_id
          @pledge_status = true
          break
        else
          @pledge_status = false
        end
      end
    end
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

  def category
    @campaigns = Campaign.where(:category => params[:category])
  end

  def popular
    @funded_array = []
    Campaign.all.each do |f|
      if f.funded_status == true
        @funded_array << f
      end
    end
    @backed = Campaign.all.sort_by { |b| -1*b.number_of_backers }
  end


  private
  def campaign_params
    params.require(:campaign).permit(:name, :description, :goal, :begin_time, :finish_time, :start_date, :end_date, :category, :tag_list, :popular, :pitch, rewards_attributes: [:name, :description, :amount, :_destroy])
  end

  def authenticate_creator
    if current_user.id != Campaign.find(params[:id]).user_id
    redirect_to troll_show_path
    end
  end
end
class My::CampaignsController < ApplicationController
  before_filter :require_login
  before_filter :require_campaign

  def index
    @campaigns = current_user.campaigns.order('campaigns.created_at DESC').all
  end

  def new
    @campaign = current_user.campaigns.build
  end

  def edit
  end

  def update
    if @campaign.update_attributes(params[:campaign])
      redirect_to [:my, :campaigns], notice: "Campaign updated!"
    else
      render :edit
    end
  end

  def create
    @campaign = current_user.campaigns.build(params[:campaign])
    if @project.save
      redirect_to [:my, :campaigns], notice: "Campaign created!"
    else
      render :new
    end
  end

  def destroy
  end

  private
  def require_campaign
    @campaign = current_user.campaigns.all
  end
end

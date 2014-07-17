class My::PledgesController < ApplicationController
  before_filter :require_login
  before_filter :require_pledge

  def index
    @pledges = current_user.pledges.order('pledges.created_at DESC').all
  end

  def update
    if @campaign.update_attributes(params[:campaign])
      redirect_to [:my, :campaigns], notice: "Campaign updated!"
    else
      render :edit
    end
  end

  def show
    @pledge = current_user.pledges.find(params[:id])
  end

  def destroy
  end

  private
  def require_pledge
    @pledge = current_user.pledges.all
  end
end

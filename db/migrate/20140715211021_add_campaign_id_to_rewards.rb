class AddCampaignIdToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :campaign_id, :integer
  end
end

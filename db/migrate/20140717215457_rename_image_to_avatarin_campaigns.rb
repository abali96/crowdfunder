class RenameImageToAvatarinCampaigns < ActiveRecord::Migration
  def change
  	rename_column :campaigns, :image, :avatar
  end
end


class SetFundedBooleanOnCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :funded_status, :boolean, :default => false
  end
end

class AddPitchToCampaign < ActiveRecord::Migration
  def change
    change_column :campaigns, :description, :text
    add_column :campaigns, :pitch, :text
  end
end

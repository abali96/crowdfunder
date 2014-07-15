class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
    	t.string :name
    	t.integer :goal
    	t.string :description
    	t.datetime :start_time
    	t.datetime :end_time
    	t.integer :user_id
      t.timestamps
    end
  end
end

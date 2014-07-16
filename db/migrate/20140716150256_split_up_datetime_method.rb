class SplitUpDatetimeMethod < ActiveRecord::Migration
  def change
    add_column :campaigns, :start_date, :date_field
    add_column :campaigns, :begin_time, :time_field
    add_column :campaigns, :end_date, :date_field
    add_column :campaigns, :finish_time, :time_field
  end
end

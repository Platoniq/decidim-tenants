# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20200518143702)

class AddElapsedTimeToTimeTrackerTimeEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_time_tracker_time_entries, :elapsed_time, :timestamp
  end
end

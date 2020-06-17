# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20200520094809)

class AddPauseAndResumeTimesToTimeTrackerTimeEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_time_tracker_time_entries, :time_pause, :datetime
    add_column :decidim_time_tracker_time_entries, :time_resume, :datetime
  end
end

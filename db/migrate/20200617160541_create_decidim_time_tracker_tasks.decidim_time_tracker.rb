# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20200302115654)

class CreateDecidimTimeTrackerTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_time_tracker_tasks do |t|
      t.jsonb :name
      t.references :time_tracker, foreign_key: { to_table: :decidim_time_trackers }
    end
  end
end

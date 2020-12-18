# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20200302115840)

class CreateDecidimTimeTrackerTimeEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_time_tracker_time_events do |t|
      t.references :decidim_user, foreign_key: { to_table: :decidim_users }
      t.references :assignation, foreign_key: { to_table: :decidim_time_tracker_assignations }
      t.references :activity, foreign_key: { to_table: :decidim_time_tracker_activities }
      t.integer :start # timestamp (seconds)
      t.integer :stop # timestamp (seconds)
      t.integer :total_seconds, null: false, default: 0
      t.timestamps
    end
  end
end

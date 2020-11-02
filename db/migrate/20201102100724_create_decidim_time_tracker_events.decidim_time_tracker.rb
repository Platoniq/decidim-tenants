# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20200921120636)

class CreateDecidimTimeTrackerEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_time_tracker_events do |t|
      t.references :decidim_user, foreign_key: { to_table: :decidim_users }
      t.references :assignee, foreign_key: { to_table: :decidim_time_tracker_assignees }
      t.references :activity, foreign_key: { to_table: :decidim_time_tracker_activities }
      t.integer :start # timestamp (seconds)
      t.integer :stop # timestamp (seconds)
      t.integer :total_seconds, null: false, default: 0
      t.timestamps
    end

    drop_table :decidim_time_tracker_time_entries

    add_timestamps :decidim_time_tracker_activities, null: false, default: -> { "NOW()" }
    add_timestamps :decidim_time_tracker_tasks, null: false, default: -> { "NOW()" }
    add_timestamps :decidim_time_tracker_milestones, null: false, default: -> { "NOW()" }
    add_timestamps :decidim_time_tracker_assignees, null: false, default: -> { "NOW()" }
  end
end

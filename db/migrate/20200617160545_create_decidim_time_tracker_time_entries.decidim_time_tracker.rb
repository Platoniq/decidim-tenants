# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20200302115840)

class CreateDecidimTimeTrackerTimeEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_time_tracker_time_entries do |t|
      t.references :assignee, foreign_key: { to_table: :decidim_time_tracker_assignees }
      t.references :activity, foreign_key: { to_table: :decidim_time_tracker_activities }
      t.references :milestone, foreign_key: { to_table: :decidim_time_tracker_milestones }
      t.datetime :time_start
      t.datetime :time_end
      t.datetime :validated_at
      t.references :validated_by_user, foreign_key: { to_table: :decidim_users }
    end
  end
end

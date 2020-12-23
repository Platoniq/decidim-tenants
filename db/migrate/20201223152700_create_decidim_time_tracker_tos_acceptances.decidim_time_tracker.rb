# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20201223115130)

class CreateDecidimTimeTrackerTosAcceptances < ActiveRecord::Migration[5.2]
  def up
    create_table :decidim_time_tracker_tos_acceptances do |t|
      t.references :assignee, foreign_key: { to_table: :decidim_time_tracker_assignees }
      t.references :time_tracker, foreign_key: { to_table: :decidim_time_trackers }
      t.timestamps
    end

    remove_column :decidim_time_tracker_assignations, :tos_accepted_at
  end

  def down
    drop_table :decidim_time_tracker_tos_acceptances
    add_column :decidim_time_tracker_assignations, :tos_accepted_at
  end
end

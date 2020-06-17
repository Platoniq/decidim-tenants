# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20200302115831)

class CreateDecidimTimeTrackerAssignees < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_time_tracker_assignees do |t|
      t.references :decidim_user, null: false, index: true
      t.references :activity, foreign_key: { to_table: :decidim_time_tracker_activities }, null: false
      t.string :status
      t.datetime :invited_at
      t.references :invited_by_user, foreign_key: { to_table: :decidim_users }
      t.datetime :requested_at
      t.datetime :tos_accepted_at
    end
  end
end

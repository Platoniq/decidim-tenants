# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20200302115658)

class CreateDecidimTimeTrackerAssignees < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_time_tracker_assignees do |t|
      t.references :decidim_user,
                   foreign_key: { to_table: :decidim_users },
                   index: true
      t.timestamps
    end
  end
end

# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20200302115700)

class CreateDecidimTimeTrackerActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_time_tracker_activities do |t|
      t.references :task,
                   foreign_key: { to_table: :decidim_time_tracker_tasks },
                   index: true,
                   null: false
      t.jsonb :description
      t.boolean :active
      t.datetime :requests_start_at
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_minutes_per_day
      t.timestamps
    end
  end
end

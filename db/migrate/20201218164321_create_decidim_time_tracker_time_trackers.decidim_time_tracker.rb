# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20200302115642)

class CreateDecidimTimeTrackerTimeTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_time_trackers do |t|
      t.references :decidim_component, index: true
      t.timestamps
    end
  end
end

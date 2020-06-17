# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20200407170410)

class RemoveTimeTrackerModel < ActiveRecord::Migration[5.2]
  class Tracker < ApplicationRecord
    self.table_name = :decidim_time_trackers
  end

  class Task < ApplicationRecord
    self.table_name = :decidim_time_tracker_tasks
  end

  class Milestone < ApplicationRecord
    self.table_name = :decidim_time_tracker_milestones
  end

  def change
    add_reference :decidim_time_tracker_tasks, :decidim_component, index: true
    add_reference :decidim_time_tracker_milestones, :decidim_component, index: true

    # rubocop:disable Rails/SkipsModelValidations
    Tracker.all.each do |tracker|
      Task.update_all(decidim_component_id: tracker.decidim_component_id)
      Milestone.update_all(decidim_component_id: tracker.decidim_component_id)
    end
    # rubocop:enable Rails/SkipsModelValidations

    remove_column :decidim_time_tracker_tasks, :time_tracker_id
    remove_column :decidim_time_tracker_milestones, :time_tracker_id
    drop_table :decidim_time_trackers
  end
end

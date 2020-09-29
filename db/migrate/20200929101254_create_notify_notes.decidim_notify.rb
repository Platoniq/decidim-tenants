# frozen_string_literal: true
# This migration comes from decidim_notify (originally 20200504071404)

class CreateNotifyNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_notify_notes do |t|
      t.string :body, null: false

      t.timestamps
    end
  end
end

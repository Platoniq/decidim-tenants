# frozen_string_literal: true
# This migration comes from decidim_notify (originally 20200514144040)

class AddNotifyNoteChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_notify_chapters do |t|
      t.string :title, null: false
      t.boolean :active, null: false, default: false
      t.references :decidim_component, index: { name: "index_decidim_notify_chapters_on_decidim_component_id" }

      t.timestamps
    end

    add_reference :decidim_notify_notes, :decidim_notify_chapter, index: { name: "index_decidim_notify_notes_on_decidim_notify_chapter_id" }
  end
end

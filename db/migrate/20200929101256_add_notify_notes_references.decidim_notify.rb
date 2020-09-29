# frozen_string_literal: true
# This migration comes from decidim_notify (originally 20200505061640)

class AddNotifyNotesReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :decidim_notify_notes, :decidim_notify_author, index: { name: "index_decidim_notify_notes_on_decidim_notify_author_id" }
    add_reference :decidim_notify_notes, :decidim_user, index: { name: "index_decidim_notify_notes_on_decidim_user_id" }
    add_reference :decidim_notify_notes, :decidim_component, index: { name: "index_decidim_notify_notes_on_decidim_component_id" }
  end
end

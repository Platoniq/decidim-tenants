# frozen_string_literal: true
# This migration comes from decidim_notify (originally 20200507103034)

class ChangeNotifyNotesAuthors < ActiveRecord::Migration[5.2]
  def change
    add_reference :decidim_notify_notes,
                  :decidim_creator,
                  index: { name: "index_decidim_notify_notes_on_decidim_creator_id" },
                  foreign_key: { to_table: :decidim_users }
    add_reference :decidim_notify_notes,
                  :decidim_author,
                  index: { name: "index_decidim_notify_notes_on_decidim_author_id" },
                  foreign_key: { to_table: :decidim_users }
    remove_column :decidim_notify_notes, :decidim_user_id
  end
end

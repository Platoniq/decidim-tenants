# frozen_string_literal: true
# This migration comes from decidim_notify (originally 20200505195918)

class AddNotifyAuthorAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_notify_authors, :admin, :boolean, default: false
  end
end

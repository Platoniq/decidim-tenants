# frozen_string_literal: true

require "spec_helper"

describe "Explore posts", type: :system do
  include_context "with a component"
  let(:manifest_name) { "blogs" }

  let!(:old_post) { create(:post, component: component, created_at: Time.current - 2.days) }
  let!(:new_post) { create(:post, component: component, created_at: Time.current) }

  describe "index" do
    it "shows all posts with their date" do
      visit_component
      expect(page).to have_selector(".card", count: 2)
      expect(page).to have_selector(".card__date", text: I18n.l(new_post.created_at, format: "%d/%m/%Y"))
      expect(page).to have_selector(".card__date", text: I18n.l(old_post.created_at, format: "%d/%m/%Y"))
    end
  end
end

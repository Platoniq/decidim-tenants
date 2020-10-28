# frozen_string_literal: true

require "rails_helper"

describe "Visit the home page", type: :system, perform_enqueued: true do
  let(:organization) { create :organization }

  before do
    switch_to_host(organization.host)
  end

  it "renders the home page" do
    visit decidim.root_path
    expect(page).to have_content("Home")
  end

  it "has the proper background color" do
    visit decidim.root_path
    expect(page.execute_script("return window.getComputedStyle($('.title-bar')[0]).backgroundColor")).to eq("rgb(87, 87, 86)")
    expect(page.execute_script("return window.getComputedStyle($('.main-footer')[0]).backgroundColor")).to eq("rgb(87, 87, 86)")
  end
end

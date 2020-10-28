# frozen_string_literal: true

require "rails_helper"
require "decidim/core/test/factories"

module Decidim
  module ParticipatoryProcesses
    describe ParticipatoryProcessGroupsController, type: :controller do
      routes { Decidim::ParticipatoryProcesses::Engine.routes }

      let(:organization) { create(:organization) }
      let!(:group) { create :participatory_process_group, organization: organization, participatory_processes: published }
      let!(:unpublished_process) do
        create(
          :participatory_process,
          :unpublished,
          organization: organization
        )
      end
      let!(:published) do
        [
          create(:participatory_process, :published, organization: organization, start_date: Date.current + 1.day),
          create(:participatory_process, :published, organization: organization, start_date: Date.current)
        ]
      end

      describe "published_processes" do
        before do
          request.env["decidim.current_organization"] = organization
        end

        it "includes only published participatory processes" do
          get :show, params: { id: group.id }

          expect(controller.helpers.participatory_processes.count).to eq(2)
          expect(controller.helpers.participatory_processes.to_a).to include(published.first)
          expect(controller.helpers.participatory_processes.to_a).to include(published.last)
          expect(controller.helpers.participatory_processes.to_a).not_to include(unpublished_process)
          expect(controller.helpers.participatory_processes.to_a.first).to eq(published.second)
          expect(controller.helpers.participatory_processes.to_a.second).to eq(published.first)
        end
      end
    end
  end
end

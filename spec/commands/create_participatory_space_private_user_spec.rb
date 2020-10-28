# frozen_string_literal: true

require "rails_helper"
require "decidim/core/test/factories"

module Decidim::Admin
  describe CreateParticipatorySpacePrivateUser do
    subject { described_class.new(form, current_user, privatable_to, via_csv) }

    let(:via_csv) { false }
    let(:privatable_to) { create :assembly }
    let(:organization) { privatable_to.organization }
    let!(:email) { "my_email@example.org" }
    let!(:name) { "Weird Guy" }
    let!(:user) { create :user, email: "my_email@example.org", organization: organization }
    let!(:current_user) { create :user, email: "some_email@example.org", organization: organization }
    let(:form) do
      double(
        invalid?: false,
        email: email,
        name: name
      )
    end
    let(:template) {}

    before do
      Rails.application.secrets.private_invites = {
        organization.host.to_sym => template
      }
    end

    shared_examples "creates private users" do
      it "creates the private user" do
        subject.call

        participatory_space_private_users = Decidim::ParticipatorySpacePrivateUser.where(user: user)

        expect(participatory_space_private_users.count).to eq 1
      end

      context "when the creation is performed via csv" do
        let(:via_csv) { true }

        it "uses another action to track the changes" do
          expect(Decidim.traceability)
            .to receive(:perform_action!)
            .with(
              "create_via_csv",
              Decidim::ParticipatorySpacePrivateUser,
              current_user,
              resource: { title: user.name }
            )

          subject.call
        end
      end

      context "when there is no user with the given email" do
        let(:email) { "does_not_exist@example.com" }

        it "creates a new user with said email" do
          subject.call
          expect(Decidim::User.last.email).to eq(email)
        end

        it "creates a new user with no application admin privileges" do
          subject.call
          expect(Decidim::User.last).not_to be_admin
        end
      end

      context "when a private user exist" do
        before do
          subject.call
        end

        it "doesn't get created twice" do
          expect { subject.call }.to broadcast(:ok)

          participatory_space_private_users = Decidim::ParticipatorySpacePrivateUser.where(user: user)

          expect(participatory_space_private_users.count).to eq 1
        end
      end
    end

    shared_examples "creates mailer jobs" do |instructions|
      shared_examples "confirmation email" do
        it "send the confirmation email" do
          clear_enqueued_jobs
          subject.call

          jobs = ActiveJob::Base.queue_adapter.enqueued_jobs
          expect(jobs.count).to eq 1

          _, _, _, queued_user, _, queued_options = ActiveJob::Arguments.deserialize(jobs.first[:args])

          expect(queued_user).to eq(user)
          expect(queued_options).to eq(invitation_instructions: instructions)
        end
      end

      context "when the user is new" do
        it_behaves_like "confirmation email"
      end

      context "when the user hasn't accepted the invitation" do
        before do
          user.invite!
        end

        it_behaves_like "confirmation email"
      end
    end

    shared_examples "do not create mailer jobs" do
      it "send the confirmation email" do
        clear_enqueued_jobs
        subject.call

        jobs = ActiveJob::Base.queue_adapter.enqueued_jobs
        expect(jobs.count).to eq 0
      end
    end

    context "when no templates defined" do
      it "returns the default" do
        expect(subject.invitation_instructions).to eq("invite_private_user")
      end

      it_behaves_like "creates private users"
      it_behaves_like "creates mailer jobs", "invite_private_user"
    end

    context "when default template is false" do
      let(:template) do
        {
          default: false
        }
      end

      it "returns the default" do
        expect(subject.invitation_instructions).to eq(false)
      end

      it_behaves_like "creates private users"
      it_behaves_like "do not create mailer jobs"
    end

    context "when default template is something" do
      let(:template) do
        {
          default: "something"
        }
      end

      it "returns the default" do
        expect(subject.invitation_instructions).to eq("something")
      end

      it_behaves_like "creates private users"
      it_behaves_like "creates mailer jobs", "something"
    end

    context "when a host template is defined" do
      let(:template) do
        {
          default: "something",
          assemblies: {
            privatable_to.slug.to_sym => "another"
          }
        }
      end

      it "returns the specific" do
        expect(subject.invitation_instructions).to eq("another")
      end

      it_behaves_like "creates private users"
      it_behaves_like "creates mailer jobs", "another"
    end

    context "when a host template is false" do
      let(:template) do
        {
          default: "something",
          assemblies: {
            privatable_to.slug.to_sym => false
          }
        }
      end

      it "returns the specific" do
        expect(subject.invitation_instructions).to eq(false)
      end

      it_behaves_like "creates private users"
      it_behaves_like "do not create mailer jobs"
    end
  end
end

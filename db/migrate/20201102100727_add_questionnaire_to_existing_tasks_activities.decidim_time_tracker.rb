# frozen_string_literal: true
# This migration comes from decidim_time_tracker (originally 20201026164554)

class AddQuestionnaireToExistingTasksActivities < ActiveRecord::Migration[5.2]
  def change
    Decidim::TimeTracker::Task.transaction do
      Decidim::TimeTracker::Task.find_each do |task|
        if task.questionnaire.blank?
          task.update!(
            questionnaire: Decidim::Forms::Questionnaire.new
          )
        end
      end
    end
  end
end

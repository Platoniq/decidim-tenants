# frozen_string_literal: true

Rails.application.config.to_prepare do
  Decidim::ParticipatoryProcesses::ParticipatoryProcessGroupsController.class_eval do
    def participatory_processes
      return @participatory_processes if @participatory_processes

      processes = if current_user
                    if current_user.admin
                      group.participatory_processes.published
                    else
                      group.participatory_processes.visible_for(current_user).published
                    end
                  else
                    group.participatory_processes.published.public_spaces
                  end

      @participatory_processes = processes.order(start_date: :asc)
    end
  end
end

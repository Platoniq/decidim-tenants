# config/initializers/time_tracker.rb

# Initialize my custom questionnaire placed in config/my_questionnaire.yml
Decidim::TimeTracker.configure do |config|
  # config.default_questionnaire_seeds = YAML.load_file File.join(Rails.root, 'config', 'my_questionnaire.yml')
end
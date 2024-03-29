# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/decidim/decidim", branch: "release/0.24-stable" }.freeze

gem "decidim", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-consultations", DECIDIM_VERSION
# gem "decidim-initiatives", DECIDIM_VERSION
gem "decidim-decidim_awesome", "~> 0.7.2"
# gem "decidim-decidim_awesome", git: "https://github.com/Platoniq/decidim-module-decidim_awesome", branch: "custom-fields"
gem "decidim-navigation_maps"
gem "decidim-notify"
gem "decidim-term_customizer", git: "https://github.com/Platoniq/decidim-module-term_customizer", branch: "temp/0.24"
gem "decidim-time_tracker", git: "https://github.com/Platoniq/decidim-module-time_tracker", branch: "main"

# gem "deface"

gem "bootsnap", "~> 1.4"
# bug in version 1.9
gem "i18n", "~> 1.8.1"

gem "puma", ">= 4.3.5"
gem "uglifier", "~> 4.1"

gem "faker", "~> 2.14"
gem "sentry-raven"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "decidim-dev", DECIDIM_VERSION
end

group :development do
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"

  gem "capistrano", "~> 3.14"
  gem "capistrano-bundler", "~> 1.6"
  gem "capistrano-passenger", "~> 0.2.0"
  gem "capistrano-rails", "~> 1.5"
  gem "capistrano-rails-console", "~> 2.3"
  gem "capistrano-rbenv", "~> 2.1"
  gem "capistrano-sidekiq", "~> 2.3"
end

group :production do
  gem "figaro", "~> 1.2"
  gem "passenger", "~> 6.0"

  gem "sidekiq", "~> 6.0"
  gem "sidekiq-cron"
end

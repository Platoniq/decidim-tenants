# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

# DECIDIM_VERSION="0.21.0"
DECIDIM_VERSION = { git: "https://github.com/decidim/decidim", tag: "release/0.22-stable" }


gem "decidim", DECIDIM_VERSION
gem "decidim-consultations", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
# #gem "decidim-initiatives", DECIDIM_VERSION
gem "decidim-navigation_maps", git: "https://github.com/Platoniq/decidim-module-navigation_maps"
gem "decidim-term_customizer", { git: "https://github.com/Platoniq/decidim-module-term_customizer", branch: "temp/0.22" }
gem "decidim-notify", git: "https://github.com/Platoniq/decidim-module-notify"
gem "decidim-decidim_awesome", git: "https://github.com/Platoniq/decidim-module-decidim_awesome"
gem "decidim-time_tracker", git: "https://github.com/Platoniq/decidim-module-time_tracker", branch: "feature/accountability_autoconfiguration"

gem "bootsnap", "~> 1.4"

gem "puma", ">= 4.3"
gem "uglifier", "~> 4.1"

gem "faker", "~> 1.9"
gem "whenever", require: false
gem "delayed_job_web"

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
  gem "capistrano-rbenv", "~> 2.1"
end

group :production do
  gem "daemons", "~> 1.3"
  gem "delayed_job_active_record", "~> 4.1"
  gem "figaro", "~> 1.2"
  gem "passenger", "~> 6.0"
end

# frozen_string_literal: true

require "sidekiq/web"
require "sidekiq/cron/web"

Rails.application.routes.draw do
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => "/sidekiq"
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  mount Decidim::Core::Engine => "/"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/formacio", to: redirect { |_path_params, _req| "https://smiles.platoniq.net/processes/training/f/181/?locale=ca" }, constraints: { host: "smiles.platoniq.net" }
  get "/formacion", to: redirect { |_path_params, _req| "https://smiles.platoniq.net/processes/training/f/181/?locale=es" }, constraints: { host: "smiles.platoniq.net" }
  get "/training", to: redirect { |_path_params, _req| "https://smiles.platoniq.net/processes/training/f/181/?locale=en" }, constraints: { host: "smiles.platoniq.net" }
end

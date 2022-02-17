# frozen_string_literal: true

Rails.application.routes.draw do
  authenticated :user, ->(user) { user.admin? } do
    mount DelayedJobWeb, at: "/delayed_job"
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  mount Decidim::Core::Engine => "/"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/formacio", to: redirect { |_path_params, _req| "https://smiles.platoniq.net/processes/training/f/181/?locale=ca" }, constraints: { host: "smiles.platoniq.net" }
  get "/formacion", to: redirect { |_path_params, _req| "https://smiles.platoniq.net/processes/training/f/181/?locale=es" }, constraints: { host: "smiles.platoniq.net" }
  get "/training", to: redirect { |_path_params, _req| "https://smiles.platoniq.net/processes/training/f/181/?locale=en" }, constraints: { host: "smiles.platoniq.net" }
end

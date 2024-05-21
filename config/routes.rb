require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :tasks do
    resource :position, only: [:update], controller: "tasks/position"
  end

  resources :lists do
    resources :tasks
    resource :position, only: [:update], controller: "lists/position"
  end
  resources :boards do
    resources :lists
  end
end

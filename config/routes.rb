Rails.application.routes.draw do
  root "home#index"

  resources :tasks do 
    patch "move"
  end
  resources :lists do 
    resources :tasks
    patch "move_left"
    patch "move_right"
  end
  resources :boards do
    resources :lists
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home, only: [:index]
end

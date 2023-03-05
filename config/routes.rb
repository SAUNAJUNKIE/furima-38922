Rails.application.routes.draw do
    devise_for :users
    root to: "items#index"
    resources :items
    post '/users/sign_up', to: 'users#create', as: 'user_registrations'

  end
  



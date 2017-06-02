Rails.application.routes.draw do

  root to: "items#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :dashboard, only: [:index]

  resources :items, only: [:index, :show]

  resources :categories, only: [:show]

  resources :carts

  namespace :carts do
    resources :items, only: [:create, :destroy]
  end

  namespace :users do
    resources :addresses, only: [:new, :create]
  end

  resources :users, only: [:new, :create]

end

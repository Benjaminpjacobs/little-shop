Rails.application.routes.draw do

  root to: "items#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :items, only: [:index, :show]

  resources :categories, only: [:show]

  resources :carts

  namespace :carts do
    resources :items, only: [:update]
  end

end

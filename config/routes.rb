Rails.application.routes.draw do

  root to: "items#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :dashboard, only: [:index]

  resources :items, only: [:index, :show]

  resources :categories, only: [:show]

  resources :carts, only: [:index, :create]

  resources :users, only: [:new, :create] do
    resources :addresses, only: [:new]
  end

end

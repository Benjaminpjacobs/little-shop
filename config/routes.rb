Rails.application.routes.draw do

  root to: "items#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :dashboard, only: [:index]

  resources :items, only: [:index, :show]

  resources :categories, only: [:show]

  resources :carts

  namespace :users do
    resources :addresses, only: [:new, :create]
  end

  resources :users, only: [:new, :create] do
    resources :orders, only: [:index, :show, :create]

  end
  put    '/cart/item', to: "cart/item#update"
  delete '/cart/item', to: "cart/item#destroy"

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :user, only: [:edit, :update, :index]
    resources :item, only: [:edit]
  end
end

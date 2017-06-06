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

  resources :users, only: [:new, :create, :edit, :update] do
    resources :orders, only: [:index, :show, :create, :destroy, :update]
  end

  put    '/cart/item', to: "cart/item#update"
  delete '/cart/item', to: "cart/item#destroy"

  put '/users/:id/password', to: 'users/password#update', as: "user_password"
  get '/users/:id/password', to: 'users/password#edit', as: "edit_user_password"

  namespace :admin do
    resources :dashboard, only: [:index, :update]
    resources :user, only: [:edit, :update, :index]
    resources :items
    resources :order, only: [:show, :create, :update]
  end
end

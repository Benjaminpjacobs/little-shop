Rails.application.routes.draw do

  root to: 'home#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :home, only: [:index]
  
  resources :dashboard, only: [:index]

  resources :items, only: [:index, :show]

  resources :categories, only: [:show]

  resources :carts

  namespace :users do
    resources :addresses
  end

  resources :users, only: [:new, :create, :edit, :update] do
    resources :orders
  end

  put    '/cart/item', to: "cart/item#update"
  delete '/cart/item', to: "cart/item#destroy"

  put '/users/:id/password', to: 'users/password#update', as: "user_password"
  get '/users/:id/password', to: 'users/password#edit', as: "edit_user_password"

  put '/admin/:id/password', to: 'admin/password#update', as: "admin_password"
  get '/admin/:id/password', to: 'admin/password#edit', as: "edit_admin_password"

  namespace :admin do
    resources :dashboard, only: [:index, :update]
    resources :user, only: [:edit, :update, :index]
    resources :items
    resources :order, only: [:show, :create, :update]
    resources :categories, except: [:show]
  end
end

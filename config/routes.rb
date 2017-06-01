Rails.application.routes.draw do
  root to: "root_directory#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :items, only: [:index]
  resources :categories, only: [:show]
end

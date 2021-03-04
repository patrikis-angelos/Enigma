Rails.application.routes.draw do
  root 'categories#index'

  get '/sessions', to: 'sessions#new'
  put '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#delete'
  resources :users, only: [:new, :create]
  resources :articles
  resources :categories
end

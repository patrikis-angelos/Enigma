Rails.application.routes.draw do
  root 'categories#index'

  get '/sessions', to: 'sessions#new'
  put '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#delete'
  resources :users, only: [:new, :create, :show]
  resources :categories, only: [:index, :show]
  resources :articles, only: [:new, :create] do
    resources :votes, only: [:create, :destroy]
  end
end

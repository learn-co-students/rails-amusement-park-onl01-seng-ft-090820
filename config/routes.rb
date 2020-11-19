Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attractions
  resources :users
  resources :rides, only: [:new, :create]
  get '/new', to: "users#new"
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get 'signout', to: "sessions#destroy"
  post '/ride', to: "users#ride"
  root to: 'users#new'
end

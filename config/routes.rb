Rails.application.routes.draw do
  
  root 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [ :new, :create, :show]
  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]

  post '/rides', to:"rides#create", as: 'rides'

end

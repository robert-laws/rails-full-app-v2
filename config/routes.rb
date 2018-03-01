Rails.application.routes.draw do
  # Root
  root 'static#home'

  # Sessions / New User
  get '/signup', to: 'users#new', as: 'new_user'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'

  # Users
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/user/:id', to: 'users#show', as: 'user'
end

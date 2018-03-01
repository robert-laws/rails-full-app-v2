Rails.application.routes.draw do
  # Root
  root 'static#home'

  # Sessions / New User
  get '/signup', to: 'users#new', as: 'new_user'

  # Users
  get '/users', to: 'users#index'
  get '/user/:id', to: 'users#show', as: 'user'
end

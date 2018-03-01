Rails.application.routes.draw do
  # Root
  root 'static#home'

  # Users
  get '/users', to: 'users#index'
  get '/user/:id', to: 'users#show', as: 'user'
end

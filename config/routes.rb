Rails.application.routes.draw do
  # Root
  root 'static#home'

  # Sessions / New User
  get '/signup', to: 'users#new', as: 'new_user'
  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
end

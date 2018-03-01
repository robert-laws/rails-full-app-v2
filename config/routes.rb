Rails.application.routes.draw do
  # Root
  root 'static#home'

  # Locations
  resources :locations, only: [:index, :show]

  # Activities
  resources :activities, only: [:index, :show]
end

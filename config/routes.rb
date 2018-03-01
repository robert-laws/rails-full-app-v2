Rails.application.routes.draw do
  # Root
  root 'static#home'

  # Locations
  resources :locations, only: [:index, :show, :new, :create] do
    resources :activities, only: [:index, :show]
  end

  # Activities
  resources :activities, only: [:index, :show]
end

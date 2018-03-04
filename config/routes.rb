Rails.application.routes.draw do
  # Root
  root 'static#home'

  get '/locations/search', to: 'locations#search', as: 'locations_search'

  # Locations
  resources :locations, only: [:index, :show, :new, :create, :edit, :update] do
    resources :activities, only: [:index, :show]
  end

  # Activities
  resources :activities, only: [:index, :show]
end

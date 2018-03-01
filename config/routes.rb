Rails.application.routes.draw do
  

  get 'activities/index'

  get 'activities/show'

  get 'locations/index'

  get 'locations/show'

  root 'static#home'
end

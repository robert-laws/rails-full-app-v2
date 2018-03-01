Rails.application.routes.draw do
  

  get 'users/index'

  get 'users/show'

  root 'static#home'
end

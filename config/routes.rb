Rails.application.routes.draw do
  resources :lost_pets
  post 'auth/login', to: 'authentication#authenticate'
end

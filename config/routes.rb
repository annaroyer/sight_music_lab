Rails.application.routes.draw do
  root to: 'home#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#index'
  get '/sight-read', to: 'sight_read#index'
end

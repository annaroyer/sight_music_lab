Rails.application.routes.draw do
  root to: 'home#index'
  resources :songs, only: [:index]
end

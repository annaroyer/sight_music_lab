Rails.application.routes.draw do
  root to: 'home#index'

  resources :tracks, only: [:create, :show]
  resources :notes, only: [:index]
end

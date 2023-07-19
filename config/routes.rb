Rails.application.routes.draw do
  resources :resorts, only: [:index, :show, :create]
  resources :bookings, only: [:index, :create]
end
Rails.application.routes.draw do
  resources :resorts, only: [:index, :show, :create, :destroy]
  resources :bookings, only: [:index, :create, :destroy]
end
Rails.application.routes.draw do
  devise_for :users
  resources :resorts, only: [:index, :show, :create, :destroy]
  resources :bookings, only: [:index, :create, :destroy]
end
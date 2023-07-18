Rails.application.routes.draw do
  resources :resorts, only: [:index]
end
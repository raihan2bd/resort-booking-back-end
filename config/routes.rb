Rails.application.routes.draw do
  root 'users/registrations#index'
  get '/current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :resorts, only: [:index, :show, :create, :destroy]
  resources :bookings, only: [:index, :create, :destroy]
end
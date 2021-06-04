Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :pools do
    resources :bookings, only: %i[new create]
  end

  resources :bookings ,only: %i[destroy]

  get "dashboard", to: "pages#dashboard"
  
  resources :pools
  get "my_pools", to: "pools#my_pools"

end

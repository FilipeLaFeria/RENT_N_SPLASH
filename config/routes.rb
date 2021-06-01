Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :pools # do
  #   resources :bookings, only: %i[new create]
  # end
end

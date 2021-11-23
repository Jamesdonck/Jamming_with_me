Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :jams do
    resources :bookings
  end
end

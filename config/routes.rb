Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :jams
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jams, only: %i[index show new destroy]
end

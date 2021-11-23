Rails.application.routes.draw do
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :jams
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jams, only: %i[index show new destroy]
end

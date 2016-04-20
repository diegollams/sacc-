Rails.application.routes.draw do
  resources :customers
  devise_for :users
  resources :users


  root 'users#index'

end

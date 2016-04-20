Rails.application.routes.draw do
  resources :interactions
  resources :lots
  resources :customers
  devise_for :users
  resources :users


  root 'users#index'

end

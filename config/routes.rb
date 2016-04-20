Rails.application.routes.draw do
  resources :lots
  resources :customers
  devise_for :users
  resources :users


  root 'users#index'

end

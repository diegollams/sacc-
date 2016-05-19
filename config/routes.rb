Rails.application.routes.draw do

  resources :surveys
  resources :quotations
  resources :appointments
  devise_for :users

  resources :interactions
  resources :lots
  resources :customers
  resources :users
  get 'dashboard/index'

  root 'dashboard#index'

end

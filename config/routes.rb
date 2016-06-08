Rails.application.routes.draw do

  resources :offers
  resources :quotations
  resources :appointments do
    patch 'cancel', on: :member
    patch 'done', on: :member
    patch 'renew', on: :member
  end
  devise_for :users

  resources :interactions
  resources :lots
  resources :customers
  resources :users
  get 'dashboard/index'

  root 'dashboard#index'

end

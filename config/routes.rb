Rails.application.routes.draw do
  devise_for :users 
  root to:'itemes#index'
  get 'itemes', to: 'itemes#index'
  resources :itemes, only: [:index, :new ,:create]
end

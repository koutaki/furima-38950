Rails.application.routes.draw do
  devise_for :users
  get 'itemes', to: 'itemes#index'
end

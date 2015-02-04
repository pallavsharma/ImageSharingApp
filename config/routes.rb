Rails.application.routes.draw do
  devise_for :users
  resources :photos

  resources :albums

  root 'home#index'
  get '/index', to: 'home#index', as: "index"
end

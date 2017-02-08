Rails.application.routes.draw do
  root "static#index"

  resources :users
  resources :attractions
  resources :rides, only: [:create]

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
end

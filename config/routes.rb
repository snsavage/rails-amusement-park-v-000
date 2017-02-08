Rails.application.routes.draw do
  root "static#index"

  resources :users

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
end

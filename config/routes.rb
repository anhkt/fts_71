Rails.application.routes.draw do

  get "/static_pages/:page", to: "static_pages#show"
  root "static_pages#show", page: "home"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "signup", to: "users#new"
  post "signup", to: "users#create"
  resources :users, except: [:index, :destroy]

  namespace :admin do
    resources :users, only: [:index, :destroy, :show]
  end
end

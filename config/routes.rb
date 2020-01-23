Rails.application.routes.draw do
  resources :posts
  resources :origamis
  resources :baskets
  resources :users

  get "users/login", to: "sessions#new", as: "login"
  post "users/login", to: "sessions#create"
  delete "sessions", to: "sessions#destroy", as: "eliminate"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/search', to 'origamis#search', as: 'search'
end

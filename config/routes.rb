Rails.application.routes.draw do

  
  resources :posts, except: [:destroy]
  resources :baskets, only: [:show]
  resources :users, only: [:show]
  resources :origamis, only: [:index, :show]
  get '/search', to: 'origamis#search', as: 'origamis_search'
  get '/results', to: 'origamis#results', as: 'origamis_search_results'


  get "users/login", to: "sessions#new", as: "login"
  post "users/login", to: "sessions#create"
  delete "sessions", to: "sessions#destroy", as: "eliminate"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/movies/:id', to: 'movies#show', as: 'movie'
  
end

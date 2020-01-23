Rails.application.routes.draw do

  get "users/login", to: "users#login", as: "login"
  post "users/login", to: "users#create_login_session", as: "create_login_session"
  resources :posts, except: [:destroy]
  resources :baskets, only: [:show]
  resources :users, except: [:destroy]
  resources :origamis, only: [:index, :show]
  get '/search', to: 'origamis#search', as: 'origamis_search'
  get '/results', to: 'origamis#results', as: 'origamis_search_results'
  
  # delete "/sessions", to: "sessions#destroy", as: "eliminate"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/movies/:id', to: 'movies#show', as: 'movie'
  
end

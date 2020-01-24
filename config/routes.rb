Rails.application.routes.draw do

  get "users/login", to: "users#login", as: "login"
  post "users/login", to: "users#create_login_session", as: "create_login_session"
  delete "users/logout", to: "users#logout", as: "logout"
  

  get '/search', to: 'origamis#search', as: 'origamis_search'
  get '/results', to: 'origamis#results', as: 'origamis_search_results'

  post 'origamis/:id/add_to_basket', to: 'users#add_to_basket', as: 'add_to_basket'
  delete 'origamis/:id/delete_from_basket', to: 'users#delete_from_basket', as: 'delete_from_basket'

  get "/my_basket", to: "baskets#my_basket", as: "my_basket"

  resources :posts, except: [:destroy]
  resources :baskets, only: [:show]
  resources :users, except: [:destroy]
  resources :origamis, only: [:index, :show]

  
  
end

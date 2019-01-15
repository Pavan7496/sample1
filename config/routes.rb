Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
   resources :sessions, only: [:new, :create, :destroy]
  root to: 'home#index'

  get "static_pages/help"
  get "static_pages/about"


  get '/signup',  to: 'users#new'
  get '/signin',  to: 'sessions#new'
  get '/logout',  to: 'sessions#destroy'
  #get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

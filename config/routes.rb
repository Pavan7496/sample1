Rails.application.routes.draw do

  get 'relationships/new'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
   resources :users do
    member do
      get :following, :followers
    end
  end
  
   resources :sessions, only: [:new, :create, :destroy]
   resources :microposts, only: [:new, :create]
   resources :relationships, only: [:create, :destroy]

 
  root    to: 'static_pages#home'
  get "/help", to:'static_pages#help'
  get "static_pages/about"

  get 'aftersignin', to:'home#index'
  get '/signup',  to: 'users#new'
  get '/users',   to: 'users#index'
  get '/signin',  to: 'sessions#new'
  get '/logout',  to: 'sessions#destroy'

  
  get '/microposts', to: 'microposts#create'
  delete '/microposts', to: 'microposts#destroy'
  #get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

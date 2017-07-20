Rails.application.routes.draw do

  root 'dashboard#index'

  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout
  get '/games/new' => 'games#new'
  get '/dashboard/' => 'dashboard#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destory]
  resources :games

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

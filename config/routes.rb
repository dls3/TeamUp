Rails.application.routes.draw do

  get '/sessions/new' => 'sessions#new'
  post '/sessions/new' => 'sessions#new'
  get '/games/new' => 'games#new'
  get '/dashboard/' => 'dashboard#index'

  resources :users
  resources :games

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

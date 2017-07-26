Rails.application.routes.draw do

  root 'dashboard#index'

  get '/users/own_games' => 'users#showr'

  get '/users/join_games' => 'rsvps#show'


  get '/index' => 'dashboard#index'
  get '/sessions' => 'sessions#new', :as => :login
  get '/sessions' => 'sessions#create'
  post '/logout' => 'sessions#destroy', :as => :logout
  get '/games/new' => 'games#new'
  get '/dashboard/' => 'dashboard#index'
  get '/about' => 'dashboard#about'
  get '/search_results' => 'searches#search_results'

  get '/users/profile' => 'users#profile'

  get '/search' => 'searches#search'
  get '/users/profile' => 'users#profile'

  get '/new_user' => 'users#new'
  post '/users' => 'users#create'

  get '/courts' => 'court_fields#populate'

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destory]
  resources :games, only: [:new, :create, :show, :edit, :update]
  resources :dashboard

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

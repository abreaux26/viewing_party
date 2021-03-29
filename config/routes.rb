Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  post '/', to: 'welcome#login'
  get '/registration', to: 'sessions#new'
  post '/registration', to: 'sessions#create'

  get '/dashboard', to: 'users#index', as: 'dashboard'
  post '/dashboard', to: 'user_friends#create'
  get '/discover', to: 'discover#index', as: 'discover'
  get '/movies', to: 'movies#index', as: 'movies'
  get '/movies/:id', to: 'movies#show', as: 'movie'
end

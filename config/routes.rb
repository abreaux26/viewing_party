Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'users#dashboard', as: 'dashboard'
  get '/discover', to: 'movies#discover', as: 'discover'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  resources :users, only: [:show, :new, :create]

  get '/signin' => 'sessions#signin', as: 'signin_session'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout_session'

  # resources :attractions

  # post 'rides/new' => 'rides#create', as: 'new_ride'
end
 
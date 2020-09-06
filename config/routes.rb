Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  get 'sessions/new'
  root 'users#new'
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :room_messages
  resources :rooms
end

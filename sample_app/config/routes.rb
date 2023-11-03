Rails.application.routes.draw do
  resources :users
  root 'static_pages#home'

  get '/home',      to: 'static_pages#home'
  get '/help',      to: 'static_pages#help'
  get '/about',     to: 'static_pages#about'
  get '/contact',   to: 'static_pages#contact'

  get '/signup',    to: 'users#new'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  get '/logout',    to: 'sessions#destroy'
  # delete "/logout", to: "sessions#destroy"

  resources :account_activations,     only: :edit
  resources :password_resets,         only: %i[new edit create update]
  resources :microposts,              only: %i[create destroy]
end

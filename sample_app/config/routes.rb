Rails.application.routes.draw do
  # get 'password_resets/new'
  # get 'password_resets/edit'
  # get 'password_resets/create'
  # get 'password_resets/update'
  # get 'sessions/new'
  root "static_pages#home"

  get "/home",      to: "static_pages#home"
  get "/help",      to: "static_pages#help"
  get "/about",     to: "static_pages#about"
  get "/contact",   to: "static_pages#contact"

  get "/signup",    to: "users#new"
  get "/login",     to: "sessions#new"
  post "/login",    to: "sessions#create"
  get "/logout",    to: "sessions#destroy"
  # delete "/logout", to: "sessions#destroy"

  resources :users
  resources :account_activations, only: :edit
  resources :password_resets, only: [:new, :edit, :create, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "application#home"
end

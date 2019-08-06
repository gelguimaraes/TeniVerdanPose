Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :indications
  resources :plataforms
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end

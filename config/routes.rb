Rails.application.routes.draw do
  resources :movies
  get 'home/index'
  root 'home#index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :indications
  resources :plataforms
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :messages, only: [:new]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'usersearch', to: 'users#search', as: 'usersearch'
  get 'plataformsearch', to: 'plataforms#search', as: 'plataformsearch'
  get 'moviessearch', to: 'movies#search', as: 'moviessearch'
end

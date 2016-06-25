Rails.application.routes.draw do
  root to: 'top#index'
  resource :user_sessions, only: [:new, :create, :destroy]
  resources :users

  get '/signup', to: 'users#new'
  get '/login', to: 'user_sessions#new'
  delete '/logout', to: 'user_sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

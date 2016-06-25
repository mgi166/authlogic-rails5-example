Rails.application.routes.draw do
  resource :user_sessions, only: [:new, :create, :destroy]

  get 'top/index'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

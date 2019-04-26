Rails.application.routes.draw do
  resources :purchases
  resources :carts
  resources :products
  # devise_for :users

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'pages#home'
  # get '/welcome', to: 'application#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

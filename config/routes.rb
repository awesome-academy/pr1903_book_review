Rails.application.routes.draw do

  devise_for :users
  resources :users do
    member do
      get :following, :followers
     end
  end

  resources :books do
    resources :reviews
  end
  resources :users

  resources :relationships,only: [:create, :destroy]
  root 'books#index'

end

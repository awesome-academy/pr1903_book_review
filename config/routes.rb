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

  resources :relationships, only: [:create, :destroy]
  resources :book_statuses
  resources :requests

  root 'books#index'

end

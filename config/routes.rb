Grandham::Application.routes.draw do

  devise_for :users

  resources :publishers
  resources :authors
  resources :books

  resource :search, only: [ :show ]

  root to: 'books#index'

  resources :language do
    namespace :admin do
      resources :publishers
      resources :authors
      resources :reviews do
        post :approve, on: :member
        post :discard, on: :member
      end
    end

    resources :authors, :publishers
    resources :books

    resources :authors
    resources :publishers
  end
end
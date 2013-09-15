Grandham::Application.routes.draw do



  get "error/access_denied"

  devise_for :users

  resources :publishers
  resources :libraries
  resources :authors
  resources :books

  resource :search, only: [ :show ]

  root to: 'books#index'

  resources :language do
    namespace :admin do
      resources :publishers
      resources :authors
      resources :libraries

      resources :edits do
        post :approve, on: :member
        post :discard, on: :member
        post :replace, on: :member
      end
    end

    resources :authors, :publishers, :libraries
    resources :books

    resources :authors
    resources :publishers
    resources :libraries
  end
end
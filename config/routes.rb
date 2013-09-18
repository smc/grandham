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
    namespace :publisher do
      resources :books
    end

    namespace :library do
      resources :books
    end

    namespace :admin do
      resources :publishers
      resources :authors
      resources :libraries
      resources :dashboard
      resources :books

      resources :new_items do
        post :approve, on: :member
        post :discard, on: :member
      end

      resources :edits do
        post :approve, on: :member
        post :discard, on: :member
        post :replace, on: :member
      end
    end

    resources :authors, :publishers, :libraries
    resources :books do
      get :history, on: :member
    end

    resources :authors do
      get :books, on: :member
    end

    resources :publishers do
      get :books, on: :member
    end

    resources :libraries do
      get :books, on: :member
    end
  end
end
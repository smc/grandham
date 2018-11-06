# frozen_string_literal: true

Grandham::Application.routes.draw do
  get "qr_generator/image"

  get "error/access_denied"

  devise_for :users

  resources :publishers
  resources :libraries
  resources :authors
  resources :books do
    post :update_cover, on: :member
  end

  resource :search do
    get :books, on: :member
    get :authors, on: :member
    get :publishers, on: :member
    get :libraries, on: :member
  end

  root to: "books#index"

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
      resources :books do
        post :publish, on: :member
        post :unpublish, on: :member
      end

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

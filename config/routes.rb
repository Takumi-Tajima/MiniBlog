# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :users do
    get 'profiles/edit'
    get 'profiles/update'
  end
  root to: 'microposts#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :microposts
  resources :users, only: %i[index show]
  resource :user do
    resource :profile, only: %i[edit update], module: :users
  end
end

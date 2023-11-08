# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'microposts#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :microposts
  resources :users, only: %i[index show]
end

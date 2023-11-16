Rails.application.routes.draw do
  namespace :users do
    get 'relationships/create'
    get 'relationships/destroy'
  end
  root to: 'microposts#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :microposts, only: %i[index show]
  resources :users, only: %i[index show]
  resource :user do
    resource :profile, only: %i[show edit update], module: :users
    resources :microposts, only: %i[new edit create update destroy], module: :users
  end
end

Rails.application.routes.draw do
  root to: 'microposts#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :microposts
  resources :users, only: %i[index show]
  resource :user do
    resource :profile, only: %i[show edit update], module: :users
  end
end

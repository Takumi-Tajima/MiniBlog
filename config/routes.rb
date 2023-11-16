Rails.application.routes.draw do
  root to: 'microposts#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :microposts, only: %i[index show] do
    member do
      get :followings, :followers
    end
  end
  resources :users, only: %i[index show]
  resource :user do
    resource :profile, only: %i[show edit update], module: :users
    resources :microposts, only: %i[new edit create update destroy], module: :users
    resource :relationships, only: %i[create destroy], module: :users
  end
end

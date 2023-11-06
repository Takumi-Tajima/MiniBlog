# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'microposts#index'
  resources :microposts
end

Rails.application.routes.draw do
  root      :to => 'microposts#index'
  resources :microposts
end

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => 'sidekiq'
  resources :stories, only: [:index, :show]
  root 'stories#index'
end

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => 'sidekiq'
  get 'stories/index'
  root 'stories#index'
end
